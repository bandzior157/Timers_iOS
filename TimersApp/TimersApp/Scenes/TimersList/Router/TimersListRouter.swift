//
//  TimersListRouter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

protocol TimersListRouter {
    func routeToNewTimer()
}

class TheTimersListRouter: TimersListRouter {
    weak var rootViewController: UIViewController?
    private var factory: ViewControllersFactory
    
    init(rootViewController: UIViewController, factory: ViewControllersFactory) {
        self.rootViewController = rootViewController
        self.factory = factory
    }
    
    func routeToNewTimer() {
        let viewController = UINavigationController(rootViewController: factory.newTimerViewController())
        present(viewController)
    }
    
    private func present(_ viewControllerToPresent: UIViewController) {
        rootViewController?.present(viewControllerToPresent, animated: true, completion: nil)
    }
}
