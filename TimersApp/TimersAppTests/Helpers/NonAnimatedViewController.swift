//
//  NonAnimatedViewController.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NonAnimatedViewController: UIViewController {
    private var lastPresentedViewController: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        lastPresentedViewController = viewControllerToPresent
//        super.present(viewControllerToPresent, animated: false, completion: completion)
    }
    
    var visibleViewController: UIViewController? {
        switch lastPresentedViewController {
        case is UINavigationController:
            let navigationController = lastPresentedViewController as! UINavigationController
            return navigationController.viewControllers.last
        default:
            return lastPresentedViewController
        }
    }
}
