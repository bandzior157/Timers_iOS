//
//  NewTimerConfigurator.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class NewTimerConfigurator {
    static func configure(viewController: NewTimerViewController) {
        let router = TheNewTimerRouter(rootViewController: viewController)
        let presenter = TheNewTimerPresenter()
        
        presenter.router = router
        viewController.presenter = presenter
    }
}
