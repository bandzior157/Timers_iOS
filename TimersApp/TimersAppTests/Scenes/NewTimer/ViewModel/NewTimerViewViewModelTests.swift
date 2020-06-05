//
//  TimerEditorViewModelTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimerEditorViewModelTests: XCTestCase {
    func test_nil_asDefaultPropertyValue() {
        let sut = TimerEditorViewModel()
        XCTAssertNil(sut.title)
        XCTAssertNil(sut.timerTitleText)
        XCTAssertNil(sut.timerBodyText)
    }
    
    func test_propertiesAreSetProperly() {
        let title = "title"
        let timerTitle = "timer t"
        let timerBody = "timer b"
        
        let sut = TimerEditorViewModel(title: title, timerTitleText: timerTitle, timerBodyText: timerBody)
        XCTAssertEqual(sut.title, title)
        XCTAssertEqual(sut.timerTitleText, timerTitle)
        XCTAssertEqual(sut.timerBodyText, timerBody)
    }
}
