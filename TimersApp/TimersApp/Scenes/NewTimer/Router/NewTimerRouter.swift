//
//  NewTimerRouter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

protocol NewTimerRouter {
    func closePresentedViewController()
}

class TheNewTimerRouter: NewTimerRouter {
    weak var rootViewController: UIViewController?

    init(rootViewController: UIViewController) {
        self.rootViewController = rootViewController
    }
    
    func closePresentedViewController() {
        rootViewController?.dismiss(animated: true)
    }
}
