//
//  DummyTimersService.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 07/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class DummyTimerService: TimerServicing {
    func fetch(completion: @escaping (ResultType) -> ()) {}
    func addTimer(_ timer: TimerPresentationModel, completion: @escaping (ResultType) -> Void) {}
    func delete(_ timerId: String, completion: @escaping (ResultType) -> Void) {}
}
