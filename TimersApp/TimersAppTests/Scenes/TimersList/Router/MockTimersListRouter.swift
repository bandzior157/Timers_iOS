//
//  MockTimersListRouter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListRouter: TimersListRouter {
    private(set) var routeToNewTimerCounter = 0
    
    func routeToNewTimer() {
        routeToNewTimerCounter += 1
    }
}
