//
//  MockTimersListInteractor.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListInteractor: TimersListInteracting {
    private(set) var fetchTimersCounter = 0
    
    func fetchTimers() {
        incrementFetchTimersCounter()
    }
    
    private func incrementFetchTimersCounter() {
        fetchTimersCounter += 1
    }
}
