//
//  ViewControllersFactory.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

protocol ViewControllersFactory {
    func newTimerViewController() -> UIViewController
}

class TheViewControllersFactory: ViewControllersFactory {
    func newTimerViewController() -> UIViewController {
        let vc = NewTimerViewController()
        NewTimerConfigurator.configure(viewController: vc)
        return vc
    }
}
