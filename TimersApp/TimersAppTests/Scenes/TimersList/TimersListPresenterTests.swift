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
    
    let view = MockTimersListViewController()
    let router = MockTimersListRouter()

    func test_routeToNewTimerCounter_getCalledOnceOn_newTimerButtonClicked() {
        makeSUT().didTapAddButton()
        XCTAssertEqual(router.routeToNewTimerCounter, 1)
    }
    
    func test_fetchTimers_onViewDidLoad() {
        let interactor = MockTimersListInteractor()
        makeSUT(interactor: interactor).viewDidLoad()
        XCTAssertEqual(interactor.fetchTimersCounter, 1)
    }
    
    func test_fetchTimers_onDismissChildViewController() {
        let interactor = MockTimersListInteractor()
        makeSUT(interactor: interactor).didTapAddButton()
        router.onDismiss?()
        XCTAssertEqual(interactor.fetchTimersCounter, 1)
    }
    
    func test_didNotUpdateView_onFetchingFailed() {
        makeSUT(interactor: FakeTimersListInteractor.failure).viewDidLoad()
        XCTAssertEqual(view.updateCounter, 0)
    }
    
    func test_updateView_onFetchingSucceed() {
        let interactor = FakeTimersListInteractor.success
        let sut = makeSUT(interactor: interactor)
        
        interactor.delegate = sut
        
        sut.viewDidLoad()
        XCTAssertEqual(view.updateCounter, 1)
    }
    
    func test_view_showMessage_onFetchingFailed() {
        let interactor = FakeTimersListInteractor.failure
        let sut = makeSUT(interactor: interactor)
        interactor.delegate = sut

        sut.viewDidLoad()
        XCTAssertEqual(view.showedMessages.count, 1)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(interactor: TimersListInteracting? = nil) -> TimersListPresenter {
        let sut = TimersListPresenter()
        sut.view = view
        sut.router = router
        sut.interactor = interactor
        return sut
    }
    
}
