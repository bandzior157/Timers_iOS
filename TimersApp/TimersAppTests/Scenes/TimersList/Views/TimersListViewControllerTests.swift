//
//  TimersViewControllerTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimersListViewControllerTests: XCTestCase {
    
    func test_title() {
        let sut = makeSUT()
        XCTAssertEqual(sut.title, "Timers")
    }
    
    func test_addButtonClick_callsPresenter() {
        let presenter = MockTimersListPresenter()
        let sut = makeSUT()
        sut.presenter = presenter
        
        let button = sut.navigationItem.rightBarButtonItem
        
        XCTAssertEqual(presenter.newTimerButtonClickedCounter, 0)
        
        button?.tap()
        XCTAssertEqual(presenter.newTimerButtonClickedCounter, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> TimersListViewController {
        let output = TimersListViewController()
        let _ = output.view
        return output
    }
}
