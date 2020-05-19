//
//  Array+GetElementTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class Array_GetElementsTests: XCTestCase {
    
    func test_getElement_forNegativeIndex_returnsNil() {
        let sut = ["A", "B", "C"]
        XCTAssertNil(sut.getElement(at: -1))
        XCTAssertNil(sut.getElement(at: -5))
    }
 
    func test_getElement_forOutOfRangeIndex_returnsNil() {
        let sut = ["A", "B", "C"]
        XCTAssertNil(sut.getElement(at: 3))
        XCTAssertNil(sut.getElement(at: 10))
    }
    
    func test_getElement_forInRangeIndex_returnsElement() {
        let sut = ["A", "B", "C"]
        XCTAssertEqual(sut.getElement(at: 0), "A")
        XCTAssertEqual(sut.getElement(at: 2), "C")
    }
    
}
