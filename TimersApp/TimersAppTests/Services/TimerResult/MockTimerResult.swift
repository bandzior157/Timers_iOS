//
//  MockTimerResult.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 14/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimerResult {
    static let failure = TimerResult.failure(MockError.someError)
    static let success = TimerResult.success([])
}
