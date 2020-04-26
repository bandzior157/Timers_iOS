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
    weak var viewController: UIViewController?

    func routeToNewTimer() {
        let viewController = NewTimerViewController()
        present(viewController)
    }
    
    private func present(_ viewControllerToPresent: UIViewController) {
        viewController?.present(viewControllerToPresent, animated: true, completion: nil)
    }
}
