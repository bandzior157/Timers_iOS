//
//  ViewControllerFactoryTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 05/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class ViewControllerFactoryTests: XCTestCase {
    
    private let dummyTimer = TimersApp.Timer(title: "", body: "")
    private let fakeFactory = FakeTimerEditorViewModelFactory()

    func test_newTimer() {
        XCTAssertEqual(makeSUT(fakeFactory).newTimerViewController().viewModel, fakeFactory.newViewModel)
    }
    
    func test_editTimer() {
        XCTAssertEqual(makeSUT(fakeFactory).editTimerViewController(for: dummyTimer).viewModel, fakeFactory.editViewModel)
    }
    
    func test_timersList() {
        XCTAssertNotNil(makeSUT(fakeFactory).timersListViewController() as TimersListViewController)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ timerEditorViewModelFactory: TimerEditorViewModelFactoryInterface) -> ViewControllerFactoryInterface {
        ViewControllerFactory(factory: timerEditorViewModelFactory)
    }
    
}
