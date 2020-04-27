//
//  NewTimerPresenter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol NewTimerPresenter {
    func cancelButtonHandler()
}

class TheNewTimerPresenter: NewTimerPresenter {
    var router: NewTimerRouter?
    
    @objc func cancelButtonHandler() {
        router?.closePresentedViewController()
    }
}



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
