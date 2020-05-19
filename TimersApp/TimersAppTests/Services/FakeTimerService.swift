//
//  FakeTimerService.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 14/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class FakeTimerService {
    static let failure = MockTimerService(resultType: MockTimerResult.failure)
    static let suceess = MockTimerService(resultType: MockTimerResult.success)
}
