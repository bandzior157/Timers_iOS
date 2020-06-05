//
//  TimerEditorViewModelFactory.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 05/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class TimerEditorViewModelFactory: TimerEditorViewModelFactoryInterface {
    func getNew() -> TimerEditorViewModel {
        TimerEditorViewModel(title: "New timer")
    }
    
    func getEdit(for timer: Timer) -> TimerEditorViewModel {
        TimerEditorViewModel(title: "Edit timer", timerTitleText: timer.title, timerBodyText: timer.body)
    }
}
