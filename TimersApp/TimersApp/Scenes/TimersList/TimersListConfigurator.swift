//
//  TimersListConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class TimersListConfigurator {
    static func configure(_ service: TimerServicing = StaticTimerService(), model: ViperConfiguratingModel<TimersListViewController, TimersListInteractor, TimersListPresenter, TimersListRouter> = ViperConfiguratingModel()) -> UIViewController {
        model.viewController.presenter = model.presenter
        
        model.interactor.service = service
        model.interactor.delegate = model.presenter
        
        model.presenter.router = model.router
        model.presenter.interactor = model.interactor
        model.presenter.view = model.viewController
                
        model.router.viewController = model.viewController

        return model.viewController
    }
}

extension TimersListViewController: SimplyInitializing {}
extension TimersListInteractor: SimplyInitializing {}
extension TimersListPresenter: SimplyInitializing {}
extension TimersListRouter: SimplyInitializing {}
