//
//  StaticTimerService.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 28/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class StaticTimerService: TimerServicing {
    private var timers: [Timer]
    
    init(timers: [Timer] = []) {
        self.timers = timers
    }
}

extension StaticTimerService {
    func fetch(completion: @escaping (ResultType) -> ()) {
        completion(.success(timers))
    }
}

extension StaticTimerService {
    func addTimer(_ timer: TimerPresentationModel, completion: @escaping (ResultType) -> Void) {
        do {
            let timer = Timer(title: timer.title, body: timer.body)
            try add(timer: timer)
            completion(.success(timers))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    private func add(timer: Timer) throws {
        if timers.contains(timer) {
            throw TimerServicingError.timerAlreadyExists
        }
    
        timers.append(timer)
    }
}

extension StaticTimerService {
    func delete(_ timerId: String, completion: @escaping (ResultType) -> Void) {
        do {
            try delete(timerId)
            completion(.success(timers))
        } catch let error {
            completion(.failure(error))
        }
    }
    
    private func delete(_ timerId: String) throws {
        guard let index = timers.firstIndex(where: { $0.id == timerId }) else {
            throw TimerServicingError.timerNotFound
        }
        timers.remove(at: index)
    }
}
