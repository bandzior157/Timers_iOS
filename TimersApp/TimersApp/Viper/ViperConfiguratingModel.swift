//
//  ViperConfiguratingModel.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 07/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class ViperConfiguratingModel<ViewController, Interactor, Presenter, Router>
    where
    ViewController: SimplyInitializing,
    Interactor: SimplyInitializing,
    Presenter: SimplyInitializing,
    Router: SimplyInitializing {
    private(set) var viewController: ViewController
    private(set) var interactor: Interactor
    private(set) var presenter: Presenter
    private(set) var router: Router
    
    init(viewController: ViewController = ViewController(), interactor: Interactor = Interactor(), presenter: Presenter = Presenter(), router: Router = Router()) {
        self.viewController = viewController
        self.interactor = interactor
        self.presenter = presenter
        self.router = router
    }
}
