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
    
    func routeToNewTimer(_ onDismiss: OnDismissCallback?) {
        routeToNewTimerCounter += 1
        self.onDismiss = onDismiss
    }
}
