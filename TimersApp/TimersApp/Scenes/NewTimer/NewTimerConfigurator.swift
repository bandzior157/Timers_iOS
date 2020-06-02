//
//  NewTimerConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NewTimerConfigurator {
    static func configure(
        viewController: NewTimerViewController = NewTimerViewController(),
        interactor: NewTimerInteractor = NewTimerInteractor(),
        presenter: NewTimerPresenter = NewTimerPresenter(),
        router: NewTimerRouter = NewTimerRouter(),
        service: TimerServicing = StaticTimerService(),
        onDismiss: OnDismissCallback?
    ) -> UIViewController {
        viewController.presenter = presenter
    
        interactor.service = service
        interactor.delegate = presenter
        
        presenter.router = router
        presenter.interactor = interactor
        presenter.view = viewController
        
        router.viewController = viewController
        router.onDismiss = onDismiss

        return viewController
    }
}
