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
        
        XCTAssertEqual(presenter.didTapAddButtonCounter, 0)
        
        button?.tap()
        XCTAssertEqual(presenter.didTapAddButtonCounter, 1)
    }
    
    func test_showMessage() {
        let sut = makeSUT()
        let alertPresenter = MockAlertPresenter()
        sut.alertPresenter = alertPresenter
        
        let message = "message"
        sut.show(message: message)
        XCTAssertEqual(alertPresenter.messages.count, 1)
        XCTAssertEqual(alertPresenter.messages.getElement(at: 0), message)
    }
    
    func test_tableViewDidSelect_called_tableViewDeselect_forSameIndexPath_andAnimated() {
        let tableView = MockDeselectedRowsTableView()
        let sut = makeSUT()
        
        let indexPath = IndexPath(row: 2, section: 3)
        sut.tableView(tableView, didSelectRowAt: indexPath)
        XCTAssertEqual(tableView.deselectedRows.count, 1)
        XCTAssertEqual(tableView.deselectedRows.getElement(at: 0)?.indexPath, indexPath)
        XCTAssertEqual(tableView.deselectedRows.getElement(at: 0)?.animated, true)
    }
    
    func test_leftBarButtonItem_isRendered() {
        let sut = makeSUT()
        let presenter = MockTimersListPresenter()
        sut.presenter = presenter
        
        let button = sut.navigationItem.leftBarButtonItem
        XCTAssertNotNil(button)
        XCTAssertEqual(button?.systemItem, UIBarButtonItem.SystemItem.edit)
        
        button?.tap()
        XCTAssertEqual(presenter.didTapEditButtonCounter, 1)
    }
    
    func test_didSelectElementAtIndex_callsPresenter_everyTime() {
        let sut = makeSUT()
        let presenter = MockTimersListPresenter()
        sut.presenter = presenter
        
        let indexPath = IndexPath(row: 3, section: 0)
        sut.tableView(sut.tableView, didSelectRowAt: indexPath)
        XCTAssertEqual(presenter.selectedElementIndexes, [indexPath.row])
        
        let indexPath2 = IndexPath(row: 13, section: 0)
        sut.tableView(sut.tableView, didSelectRowAt: indexPath2)
        sut.tableView(sut.tableView, didSelectRowAt: indexPath2)
        XCTAssertEqual(presenter.selectedElementIndexes, [indexPath.row, indexPath2.row, indexPath2.row])
    }
        
    
    // MARK: - Helpers
    
    private func makeSUT() -> TimersListViewController {
        let output = TimersListViewController()
        let _ = output.view
        return output
    }
}

class MockDeselectedRowsTableView: UITableView {
    private(set) var deselectedRows = [(indexPath: IndexPath, animated: Bool)]()
    
    override func deselectRow(at indexPath: IndexPath, animated: Bool) {
        deselectedRows.append((indexPath, animated))
    }
}
