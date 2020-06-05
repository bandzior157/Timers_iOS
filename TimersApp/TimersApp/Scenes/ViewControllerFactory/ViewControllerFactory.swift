//
//  ViewControllerFactory.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 05/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class ViewControllerFactory: ViewControllerFactoryInterface {
    private let timerEditorViewModelFactory: TimerEditorViewModelFactoryInterface
    
    init(factory: TimerEditorViewModelFactoryInterface) {
        self.timerEditorViewModelFactory = factory
    }
    
    func newTimerViewController() -> NewTimerViewController {
        let viewModel = timerEditorViewModelFactory.getNew()
        return NewTimerViewController(viewModel: viewModel)
    }
    
    func editTimerViewController(for timer: Timer) -> NewTimerViewController {
        let viewModel = timerEditorViewModelFactory.getEdit(for: timer)
        return NewTimerViewController(viewModel: viewModel)
    }
    
    func timersListViewController() -> TimersListViewController {
        TimersListViewController()
    }
}
