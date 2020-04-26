//
//  TimersListConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class TimersListConfigurator {
    static func configure(viewController: TimersListViewController) {
        let router = TheTimersListRouter(rootViewController: viewController, factory: TheViewControllersFactory())
        
        let presenter = TheTimersListPresenter()
        presenter.router = router
        
        viewController.presenter = presenter
    }
}
