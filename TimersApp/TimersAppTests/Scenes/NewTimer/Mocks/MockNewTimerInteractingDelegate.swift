//
//  MockNewTimerInteractingDelegate.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockNewTimerInteractingDelegate: NewTimerInteractingDelegate {
    private(set) var didFinishWithTimersCounter = 0
    private(set) var didFailWithErrorCounter = 0

    func newTimerInteractor(_ interactor: NewTimerInteracting, didFinishWithTimers timers: [TimersApp.Timer]) {
        didFinishWithTimersCounter += 1
    }
    
    func newTimerInteractor(_ interactor: NewTimerInteracting, didFailWithError error: Error) {
        didFailWithErrorCounter += 1
    }
}
