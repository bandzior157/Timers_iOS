//
//  NewTimerViewControllerTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerViewControllerTests: XCTestCase {
    
    func test_title() {
        XCTAssertEqual(makeSUT().title, "New timer")
    }
    
    func test_cancelButton_isSystemCancelButton_placedLeftOnNavigationBar() {
        let button = makeSUT().navigationItem.leftBarButtonItem
        XCTAssertEqual(button?.systemItem, UIBarButtonItem.SystemItem.cancel)
    }
    
    func test_cancelButtonClick_callsPresenterCancelMethod() {
        let sut = makeSUT()
        let presenter = MockNewTimerPresenter()
        sut.presenter = presenter
        let button = sut.navigationItem.leftBarButtonItem
        
        XCTAssertEqual(presenter.cancelCounter, 0)

        button?.tap()
        XCTAssertEqual(presenter.cancelCounter, 1)
    }
    
    func test_saveButton_isSystemSaveButton_placedRightOnNavigationBar() {
        let button = makeSUT().navigationItem.rightBarButtonItem
        XCTAssertEqual(button?.systemItem, UIBarButtonItem.SystemItem.save)
    }
    
    func test_saveButtonClick_callsPresenterSaveMethod() {
        let sut = makeSUT()
        let presenter = MockNewTimerPresenter()
        sut.presenter = presenter
        let button = sut.navigationItem.rightBarButtonItem
        
        XCTAssertEqual(presenter.saveCounter, 0)

        button?.tap()
        XCTAssertEqual(presenter.saveCounter, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> NewTimerViewController {
        let viewController = NewTimerViewController()
        let _ = viewController.view
        return viewController
    }
    
}
