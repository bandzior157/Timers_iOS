//
//  TimerEditorViewModelFactoryInterface.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 05/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol TimerEditorViewModelFactoryInterface {
    func getNew() -> TimerEditorViewModel
    func getEdit(for timer: Timer) -> TimerEditorViewModel
}
