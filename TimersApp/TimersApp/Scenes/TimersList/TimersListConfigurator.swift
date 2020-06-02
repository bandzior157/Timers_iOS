//
//  TimersListConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class TimersListConfigurator {
    static func configure(
        viewController: TimersListViewController = TimersListViewController(),
        interactor: TimersListInteractor = TimersListInteractor(),
        presenter: TimersListPresenter = TimersListPresenter(),
        router: TimersListRouter = TimersListRouter(),
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
