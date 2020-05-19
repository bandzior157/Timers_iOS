//
//  TimersListInteractorTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp


class TimersListInteractorTests: XCTestCase {
    
    fileprivate let delegate = MockTimersListInteractingDelegate()

    func test_fetchTimers_notifiesDelegateAboutServiceFailure() {
        
        let service = MockTimerService(resultType: makeFailureResult())
        let sut = makeSUT(service, delegate)
    
        XCTAssertEqual(delegate.firstCounter, 0)
        XCTAssertEqual(delegate.secondCounter, 0)
        
        sut.fetchTimers()
        XCTAssertEqual(delegate.firstCounter, 0)
        XCTAssertEqual(delegate.secondCounter, 1)
    }
    
    func test_fetchTimers_notifiesDelegateAboutServiceSuccess() {
        let timers = [TimersApp.Timer(title: "n", body: "d")]
        let resultType = MockTimerService.ResultType.success(timers)
        let service = MockTimerService(resultType: resultType)
        let sut = makeSUT(service, delegate)
    
        XCTAssertEqual(delegate.firstCounter, 0)
        XCTAssertEqual(delegate.secondCounter, 0)
        
        sut.fetchTimers()
        XCTAssertEqual(delegate.firstCounter, 1)
        XCTAssertEqual(delegate.secondCounter, 0)
    }
    
    
    // MARK: - Helpers
    
    private func makeFailureResult() -> Result<[TimersApp.Timer], Error> {
        let error = MockError.someError
        let resultType = MockTimerService.ResultType.failure(error)
        return resultType
    }
    
    private func makeSUT(_ service: TimerServicing, _ delegate: TimersListInteractingDelegate? = nil) -> TimersListInteractor {
        let sut = TimersListInteractor()
        sut.service = service
        sut.delegate = delegate
        return sut
    }
}
