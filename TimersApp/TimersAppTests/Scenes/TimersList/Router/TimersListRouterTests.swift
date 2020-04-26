//
//  TimersListRouterTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimersListRouterTests: XCTestCase {
    
    func test_routeToNewTimer() {
        let viewController = NonAnimatedViewController()
        let factory = FakeViewControllersFactory()

        let sut = makeSUT(viewController, factory)
        
        XCTAssertNil(viewController.lastPresentedViewController)

        sut.routeToNewTimer()
        XCTAssertEqual(viewController.lastPresentedViewController, factory.fakeNewTimerViewController)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ rootViewController: UIViewController, _ factory: ViewControllersFactory) -> TheTimersListRouter {
        TheTimersListRouter(rootViewController: rootViewController, factory: factory)
    }
}
