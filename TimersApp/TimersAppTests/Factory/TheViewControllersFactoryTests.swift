//
//  TheViewControllersFactoryTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TheViewControllersFactoryTests: XCTestCase {
    
    func test_newTimerViewController() {
        let sut = makeSUT()
        XCTAssertTrue(sut.newTimerViewController() is NewTimerViewController)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT() -> TheViewControllersFactory {
        TheViewControllersFactory()
    }
    
}
