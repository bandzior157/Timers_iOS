//
//  SimpleAlertPresenter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 11/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class SimpleAlertPresenter: SimpleAlertShowing {
    func show(message: String, from viewController: UIViewController) {
        viewController.present(UIAlertController(title: message), animated: true)
    }
}
