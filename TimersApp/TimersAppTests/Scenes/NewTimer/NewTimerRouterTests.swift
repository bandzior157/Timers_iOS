//
//  NewTimerRouterTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerRouterTest: XCTestCase {
    
    func test_closePresentedVC_dismissViewController_withOnDismissCompletion() {
        let sut = makeSUT()
        let viewController = NonAnimatedDismissViewController()
        
        var counter = 0
        let onDismiss = {
            counter += 1
        }
        
        sut.viewController = viewController
        sut.onDismiss = onDismiss
        
        sut.closePresentedViewController()
        
        XCTAssertEqual(counter, 1)
        XCTAssertEqual(viewController.dismissCounter, 1)
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> NewTimerRouter {
        NewTimerRouter()
    }
    
}
