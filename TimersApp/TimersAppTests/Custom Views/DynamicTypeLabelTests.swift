//
//  DynamicTypeLabelTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class DynamicTypeLabelTests: XCTestCase {
    
    func test_initWithCoder() {
        XCTAssertNil(DynamicTypeLabel(coder: NSCoder()))
    }
    
    func test_convenienceInit_frame() {
        let frame = CGRect.testableRandom
        XCTAssertEqual(convenienceInit(frame: frame).frame, frame)
    }
    
    func test_convenienceInit_text() {
        let text = String.testableRandom
        XCTAssertEqual(convenienceInit(text: text).text, text)
    }
    
    func test_convenienceInit_textStyle() {
        let textStyle = UIFont.TextStyle.testableRandom
        XCTAssertEqual(convenienceInit(textStyle: textStyle).font, UIFont.preferredFont(forTextStyle: textStyle))
    }
    
    
    // MARK: - Helpers
    
    private func convenienceInit(frame: CGRect = .zero, text: String? = nil, textStyle: UIFont.TextStyle = .body) -> DynamicTypeLabel {
        DynamicTypeLabel(frame: frame, text: text, textStyle: textStyle)
    }
    
}
