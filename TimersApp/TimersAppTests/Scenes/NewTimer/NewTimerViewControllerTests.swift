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
    
    let presenter = MockNewTimerPresenter()
    let alertPresenter = MockAlertPresenter()

    func test_title() {
        XCTAssertEqual(makeSUT().title, "New timer")
    }
    
    func test_cancelButton_isSystemCancelButton_placedLeftOnNavigationBar() {
        let button = makeSUT().navigationItem.leftBarButtonItem
        XCTAssertEqual(button?.systemItem, UIBarButtonItem.SystemItem.cancel)
    }
    
    func test_cancelButtonClick_callsPresenterCancelMethod() {
        let sut = makeSUT(presenter: presenter)
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
        let sut = makeSUT(presenter: presenter)
        let button = sut.navigationItem.rightBarButtonItem
        
        XCTAssertEqual(presenter.saveCounter, 0)

        button?.tap()
        XCTAssertEqual(presenter.saveCounter, 1)
    }
    
    func test_alertPresenterGetCalled_onShow() {
        let sut = makeSUT(alertPresenter: alertPresenter)
        let message = "message"
        sut.show(message: message)
        XCTAssertEqual(alertPresenter.messages.count, 1)
        XCTAssertEqual(alertPresenter.messages.getElement(at: 0), message)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(presenter: NewTimerPresenting? = nil, alertPresenter: SimpleAlertShowing? = nil) -> NewTimerViewController {
        let sut = NewTimerViewController()
        sut.presenter = presenter
        sut.alertPresenter = alertPresenter
        sut.loadViewIfNeeded()
        return sut
    }
    
}
