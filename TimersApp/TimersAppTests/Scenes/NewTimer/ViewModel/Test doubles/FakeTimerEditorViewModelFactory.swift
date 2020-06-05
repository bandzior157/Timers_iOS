//
//  FakeTimerEditorViewModelFactory.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 05/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

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
