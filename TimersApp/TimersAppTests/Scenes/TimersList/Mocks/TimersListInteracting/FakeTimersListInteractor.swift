//
//  FakeTimersListInteractor.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class FakeTimersListInteractor: TimersListInteracting {
    private let result: TimerResult
    weak var delegate: TimersListInteractingDelegate?
    
    init(result: TimerResult) {
        self.result = result
    }
    
    func fetchTimers() {
        switch result {
        case .success(let timers):
            delegate?.timersListInteractor(self, didFinishWithTimers: timers)
        case .failure(let error):
            delegate?.timersListInteractor(self, didFailWithError: error)
        }
    }
}

extension FakeTimersListInteractor {
    static let failure = FakeTimersListInteractor(result: MockTimerResult.failure)
    static let success = FakeTimersListInteractor(result: MockTimerResult.success)
}
