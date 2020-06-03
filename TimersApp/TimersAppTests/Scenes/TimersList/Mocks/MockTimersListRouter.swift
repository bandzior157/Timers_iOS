//
//  MockTimersListRouter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListRouter: TimersListRouting {
    private(set) var onDismiss: OnDismissCallback?
    private(set) var routeToNewTimerCounter = 0
    private(set) var routedTimers = [Timer]()
    
    func routeToNewTimer(_ onDismiss: OnDismissCallback?) {
        routeToNewTimerCounter += 1
        self.onDismiss = onDismiss
    }
    
    func route(to timer: Timer) {
        routedTimers.append(timer)
    }
    
}
