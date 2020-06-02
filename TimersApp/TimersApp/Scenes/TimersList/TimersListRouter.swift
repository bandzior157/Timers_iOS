//
//  TimersListRouter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

final class TimersListRouter: TimersListRouting {
    var viewController: UIViewController?
            
    func routeToNewTimer(_ onDismiss: OnDismissCallback? = nil) {
        let viewController = UINavigationController(rootViewController: NewTimerConfigurator.configure(service: TimerService.shared, onDismiss: onDismiss))
        present(viewController)
    }
    
    private func present(_ viewControllerToPresent: UIViewController) {
        viewController?.present(viewControllerToPresent, animated: true)
    }
}
