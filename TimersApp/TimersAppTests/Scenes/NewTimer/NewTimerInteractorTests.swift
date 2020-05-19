//
//  NewTimerInteractorTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerInteractorTests: XCTestCase {
    
    let delegate = MockNewTimerInteractingDelegate()
    
    func test_addTimer_invalidTimer_callsDelegateDidFailWithError() {
        makeSUT().addTimer(invalidTimer)
        XCTAssertEqual(delegate.didFailWithErrorCounter, 1)
    }
    
    func test_addTimer_validTimer_serviceSuccess_callsDelegateDidFinishWithTimers() {
        makeSUT(service: FakeTimerService.suceess).addTimer(validTimer)
        XCTAssertEqual(delegate.didFinishWithTimersCounter, 1)
    }
    
    func test_addTimer_validTimer_serviceFailed_callsDelegateDidFailWithError() {
        makeSUT(service: FakeTimerService.failure).addTimer(validTimer)
        XCTAssertEqual(delegate.didFailWithErrorCounter, 1)
    }
    
    
    // MARK: - Helpers
    
    private let invalidTimer = TimerPresentationModel(title: "", body: "d")
    private let validTimer = TimerPresentationModel(title: "t", body: "d")
        
    private func makeSUT(service: TimerServicing? = DummyTimerService()) -> NewTimerInteractor {
        let sut = NewTimerInteractor()
        sut.service = service
        sut.delegate = delegate
        return sut
    }
    
}
