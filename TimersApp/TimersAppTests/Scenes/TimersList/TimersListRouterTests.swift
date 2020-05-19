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

        let sut = makeSUT(viewController)
        
        XCTAssertNil(viewController.visibleViewController)

        sut.routeToNewTimer()
        XCTAssertTrue(viewController.visibleViewController is NewTimerViewController)
    }
        
    
    // MARK: - Helpers
    
    private func makeSUT(_ viewController: UIViewController) -> TimersListRouter {
        let sut = TimersListRouter()
        sut.viewController = viewController
        return sut
    }
}
