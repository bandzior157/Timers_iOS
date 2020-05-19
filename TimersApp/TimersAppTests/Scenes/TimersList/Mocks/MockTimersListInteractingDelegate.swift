//
//  MockTimersListInteractingDelegate.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 10/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListInteractingDelegate: TimersListInteractingDelegate {
    private(set) var firstCounter = 0
    private(set) var secondCounter = 0
    
    func timersListInteractor(_ interactor: TimersListInteracting, didFinishWithTimers timers: [TimersApp.Timer]) {
        firstCounter += 1
    }
    
    func timersListInteractor(_ interactor: TimersListInteracting, didFailWithError error: Error) {
        secondCounter += 1
    }
}
