//
//  TimerTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimerTests: XCTestCase {
    
    func test_areEqual_sameNameAndDescription() {
        let lhs = makeSUT("A", "AAA")
        let rhs = makeSUT("A", "AAA")
        XCTAssertEqual(lhs, rhs)
    }
    
    func test_areNotEqual_differentName() {
        let lhs = makeSUT("A", "AAA")
        let rhs = makeSUT("B", "AAA")
        XCTAssertNotEqual(lhs, rhs)
    }
    
    func test_areNotEqual_differentDescription() {
        let lhs = makeSUT("A", "AAA")
        let rhs = makeSUT("A", "AAB")
        XCTAssertNotEqual(lhs, rhs)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ title: String, _ body: String) -> TimersApp.Timer {
        TimersApp.Timer.init(title: title, body: body)
    }
}
