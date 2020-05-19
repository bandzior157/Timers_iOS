//
//  MockNewTimerRouter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 12/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockNewTimerRouter: NewTimerRouting {
    private(set) var closePresentedViewControllerCounter = 0
    
    func closePresentedViewController() {
        closePresentedViewControllerCounter += 1
    }
}
