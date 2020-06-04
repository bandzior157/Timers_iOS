//
//  NewTimerViewViewModelsFactoryTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerViewViewModelsFactoryTests: XCTestCase {
   
    func test_properViewModel_forNew() {
        let viewModel = NewTimerViewViewModelsFactory.getNew()
        XCTAssertEqual(viewModel, NewTimerViewViewModel(title: "New timer"))
    }
    
    func test_properViewModel_forEdit() {
        let timer = TimersApp.Timer(title: "timer title", body: "timer body")
        let viewModel = NewTimerViewViewModelsFactory.getEdit(for: timer)
        XCTAssertEqual(viewModel, NewTimerViewViewModel(title: "Edit timer", timerTitleText: "timer title", timerBodyText: "timer body"))
    }
    
}

class NewTimerViewViewModelsFactory {
    static func getNew() -> NewTimerViewViewModel {
        NewTimerViewViewModel(title: "New timer")
    }
    
    static func getEdit(for timer: TimersApp.Timer) -> NewTimerViewViewModel {
        NewTimerViewViewModel(title: "Edit timer", timerTitleText: timer.title, timerBodyText: timer.body)
    }
}
