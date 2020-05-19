//
//  NewTimerConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NewTimerConfigurator {
    static func configure(_ service: TimerServicing = StaticTimerService(), model: ViperConfiguratingModel<NewTimerViewController, NewTimerInteractor, NewTimerPresenter, NewTimerRouter> = ViperConfiguratingModel(), _ onDismiss: OnDismissCallback?) -> UIViewController {
        model.viewController.presenter = model.presenter
    
        model.interactor.service = service
        model.interactor.delegate = model.presenter
        
        model.presenter.router = model.router
        model.presenter.interactor = model.interactor
        model.presenter.view = model.viewController
        
        model.router.viewController = model.viewController
        model.router.onDismiss = onDismiss

        return model.viewController
    }
}

extension NewTimerViewController: SimplyInitializing {}
extension NewTimerInteractor: SimplyInitializing {}
extension NewTimerPresenter: SimplyInitializing {}
extension NewTimerRouter: SimplyInitializing {}
