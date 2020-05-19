//
//  StaticTimerServiceTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class StaticTimerServiceTests: XCTestCase {
    
    let factory = TimerPresentationFactory(title: "A", body: "B")

    func test_addTimer_success_forNotExistingTimer() {
        makeSUT().addTimer(factory.getTimerPresentationModel()) {
            XCTAssertEqual($0, TimerResult.success([self.factory.getTimer()]))
        }
    }
    
    func test_addTimer_returnsTimerAlreadyExistsError_forExisitingTimer() {
        makeSUT([factory.getTimer()]).addTimer(factory.getTimerPresentationModel()) {
            XCTAssertEqual($0, TimerResult.failure(TimerServicingError.timerAlreadyExists))
        }
    }
    
    func test_deleteTimer_returnsTimerNotFoundError_forNotExistingTimer() {
        makeSUT([]).delete(factory.getTimer().id) {
            XCTAssertEqual($0, TimerResult.failure(TimerServicingError.timerNotFound))
        }
    }
    
    func test_deleteTimer_success_forExistingTimer() {
        let timer = factory.getTimer()
        
        makeSUT([timer]).delete(timer.id) {
            XCTAssertEqual($0, TimerResult.success([]))
        }
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ timers: [TimersApp.Timer] = []) -> StaticTimerService {
        StaticTimerService(timers: timers)
    }
    
}
