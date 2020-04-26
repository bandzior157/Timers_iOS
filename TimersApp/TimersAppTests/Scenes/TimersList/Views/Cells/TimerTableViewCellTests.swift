//
//  TimerTableViewCell.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimerTableViewCellTests: XCTestCase {
    
    func test_nameLabel() {
        let sut = makeSUT()
        sut.nameLabel.text = "ABC"
        XCTAssertEqual(sut.nameLabel.text, "ABC")
    }
    
    func test_descriptionLabel() {
        let sut = makeSUT()
        sut.descriptionLabel.text = "CDE"
        XCTAssertEqual(sut.descriptionLabel.text, "CDE")
    }
    
    func test_setTimerCellViewModel() {
        let sut = makeSUT()
        let viewModel = TimerCellViewModel(nameText: "N", descriptionText: "D")
        sut.set(for: viewModel)
        XCTAssertEqual(sut.nameLabel.text, "N")
        XCTAssertEqual(sut.descriptionLabel.text, "D")
    }
    
    // MARK: - Helpers
    
    private func makeSUT() -> TimerTableViewCell {
        let cell = TimerTableViewCell()
        return cell
    }
    
}
