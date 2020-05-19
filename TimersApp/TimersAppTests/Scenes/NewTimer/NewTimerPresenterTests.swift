//
//  NewTimerPresenterTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 12/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerPresenterTests: XCTestCase {
    
    let view = MockNewTimerView()
    let interactor = MockNewTimerInteractor()
    let router = MockNewTimerRouter()

    func test_cancel_callsRouter_closePresenterViewController() {
        makeSUT().cancel()
        XCTAssertEqual(router.closePresentedViewControllerCounter, 1)
    }
    
    func test_save_callsInteractor_addTimer() {
        makeSUT().save()
        XCTAssertEqual(interactor.addedTimers.count, 1)
    }
    
    func test_save_callsInteractor_addTimer_withEmptyTimer() {
        makeSUT().save()
        let expectedTimer = TimerPresentationModel(title: "", body: "")
        XCTAssertEqual(interactor.addedTimers[0], expectedTimer)
    }
    
    func test_titleChanged_setTimerTitle() {
        let sut = makeSUT()
        sut.titleChanged("new title")
        sut.save()
        XCTAssertEqual(interactor.addedTimers.count, 1)
        
        let expectedTimer = TimerPresentationModel(title: "new title", body: "")
        XCTAssertEqual(interactor.addedTimers[0], expectedTimer)
    }
    
    func test_descriptionChanged_setTimerDescription() {
        let sut = makeSUT()
        sut.descriptionChanged("new desc")
        sut.save()
        XCTAssertEqual(interactor.addedTimers.count, 1)
        
        let expectedTimer = TimerPresentationModel(title: "", body: "new desc")
        XCTAssertEqual(interactor.addedTimers[0], expectedTimer)
    }
    
    func test_newTimerInteractorDidFinishWithTimers_callsRouter_closePresentedViewController() {
        let sut = makeSUT()
        sut.newTimerInteractor(interactor, didFinishWithTimers: [])
        XCTAssertEqual(router.closePresentedViewControllerCounter, 1)
    }
    
    func test_newTimerInteractorDidFailWithError_callsView_showMessage() {
        let sut = makeSUT()
        
        let error = MockError.someError
        sut.newTimerInteractor(interactor, didFailWithError: error)
        XCTAssertEqual(view.showedMessages.count, 1)
        XCTAssertEqual(view.showedMessages[0], error.localizedDescription)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> NewTimerPresenter {
        let sut = NewTimerPresenter()
        sut.router = router
        sut.interactor = interactor
        sut.view = view
        return sut
    }
    
}
