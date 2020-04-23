//
//  TimersViewControllerTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimersViewControllerTests: XCTestCase {
    
    func test_title() {
        let sut = makeSUT()
        XCTAssertEqual(sut.title, "Timers")
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> TimersViewController {
        let output = TimersViewController()
        let _ = output.view
        return output
    }
    
}
