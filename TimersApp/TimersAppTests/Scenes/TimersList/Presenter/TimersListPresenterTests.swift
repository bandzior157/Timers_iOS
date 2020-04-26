//
//  TimersListPresenterTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimersListPresenterTests: XCTestCase {
    
    func test_routeToNewTimerCounter_getCalledOnceOn_newTimerButtonClicked() {
        let sut = makeSUT()
        let router = MockTimersListRouter()
        sut.router = router
        
        XCTAssertEqual(router.routeToNewTimerCounter, 0)
        
        sut.newTimerButtonClicked()
        XCTAssertEqual(router.routeToNewTimerCounter, 1)
    
        sut.newTimerButtonClicked()
        XCTAssertEqual(router.routeToNewTimerCounter, 2)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> TheTimersListPresenter {
        TheTimersListPresenter()
    }
}
