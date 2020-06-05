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

protocol ViewControllerFactoryInterface {
    func newTimerViewController() -> NewTimerViewController
    func editTimerViewController(for timer: TimersApp.Timer) -> NewTimerViewController
    func timersListViewController() -> TimersListViewController
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
    
    func timersListViewController() -> TimersListViewController {
        TimersListViewController()
    }
}
