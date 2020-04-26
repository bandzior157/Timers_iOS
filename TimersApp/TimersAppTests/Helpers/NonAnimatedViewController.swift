//
//  NonAnimatedViewController.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NonAnimatedViewController: UIViewController {
    private(set) var lastPresentedViewController: UIViewController?
    
    override func present(_ viewControllerToPresent: UIViewController, animated flag: Bool, completion: (() -> Void)? = nil) {
        lastPresentedViewController = viewControllerToPresent
//        super.present(viewControllerToPresent, animated: false, completion: completion)
    }
}
