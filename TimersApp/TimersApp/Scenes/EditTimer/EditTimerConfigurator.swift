//
//  EditTimerConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 04/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class EditTimerConfigurator {
    static func configure(
        viewController: NewTimerViewController = NewTimerViewController(viewModel: NewTimerViewViewModel(title: "Edit timer")),
        interactor: NewTimerInteractor = NewTimerInteractor(),
        presenter: NewTimerPresenter = NewTimerPresenter(),
        router: NewTimerRouter = NewTimerRouter(),
        service: TimerServicing = StaticTimerService()
    ) -> UIViewController {
        viewController.presenter = presenter
    
        interactor.service = service
        interactor.delegate = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        
        router.viewController = viewController

        return viewController
    }
}
