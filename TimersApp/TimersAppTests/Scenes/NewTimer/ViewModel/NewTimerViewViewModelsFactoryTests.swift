//
//  TimerEditorViewModelsFactoryTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class TimerEditorViewModelFactoryTests: XCTestCase {
   
    func test_properViewModel_forNew() {
        let viewModel = TimerEditorViewModelFactory().getNew()
        XCTAssertEqual(viewModel, TimerEditorViewModel(title: "New timer"))
    }
    
    func test_properViewModel_forEdit() {
        let timer = TimersApp.Timer(title: "timer title", body: "timer body")
        let viewModel = TimerEditorViewModelFactory().getEdit(for: timer)
        XCTAssertEqual(viewModel, TimerEditorViewModel(title: "Edit timer", timerTitleText: "timer title", timerBodyText: "timer body"))
    }
    
}

protocol TimerEditorViewModelFactoryInterface {
    func getNew() -> TimerEditorViewModel
    func getEdit(for timer: TimersApp.Timer) -> TimerEditorViewModel
}

class TimerEditorViewModelFactory: TimerEditorViewModelFactoryInterface {
    func getNew() -> TimerEditorViewModel {
        TimerEditorViewModel(title: "New timer")
    }
    
    func getEdit(for timer: TimersApp.Timer) -> TimerEditorViewModel {
        TimerEditorViewModel(title: "Edit timer", timerTitleText: timer.title, timerBodyText: timer.body)
    }
}

class FakeTimerEditorViewModelFactory: TimerEditorViewModelFactoryInterface {
    let newViewModel = TimerEditorViewModel(title: "new", timerTitleText: "new", timerBodyText: "new")
    let editViewModel = TimerEditorViewModel(title: "edit", timerTitleText: "edit", timerBodyText: "edit")
    
    func getNew() -> TimerEditorViewModel {
        newViewModel
    }
    
    func getEdit(for timer: TimersApp.Timer) -> TimerEditorViewModel {
        editViewModel
    }
}

class ViewControllerFactoryTests: XCTestCase {
    
    private let dummyTimer = TimersApp.Timer(title: "", body: "")
    private let fakeFactory = FakeTimerEditorViewModelFactory()

    func test_newTimer() {
        XCTAssertEqual(makeSUT(fakeFactory).newTimerViewController().viewModel, fakeFactory.newViewModel)
    }
    
    func test_editTimer() {
        XCTAssertEqual(makeSUT(fakeFactory).editTimerViewController(for: dummyTimer).viewModel, fakeFactory.editViewModel)
    }
    
    
    // MARK: - Helpers
    
    private func makeSUT(_ timerEditorViewModelFactory: TimerEditorViewModelFactoryInterface) -> ViewControllerFactoryInterface {
        ViewControllerFactory(factory: timerEditorViewModelFactory)
    }
    
}

protocol ViewControllerFactoryInterface {
    func newTimerViewController() -> NewTimerViewController
    func editTimerViewController(for timer: TimersApp.Timer) -> NewTimerViewController
}

class ViewControllerFactory: ViewControllerFactoryInterface {
    private let timerEditorViewModelFactory: TimerEditorViewModelFactoryInterface
    
    init(factory: TimerEditorViewModelFactoryInterface) {
        self.timerEditorViewModelFactory = factory
    }
    
    func newTimerViewController() -> NewTimerViewController {
        let viewModel = timerEditorViewModelFactory.getNew()
        return NewTimerViewController(viewModel: viewModel)
    }
    
    func editTimerViewController(for timer: TimersApp.Timer) -> NewTimerViewController {
        let viewModel = timerEditorViewModelFactory.getEdit(for: timer)
        return NewTimerViewController(viewModel: viewModel)
    }
}
