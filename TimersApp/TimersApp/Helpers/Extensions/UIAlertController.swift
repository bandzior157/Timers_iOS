//
//  UIAlertController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 11/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UIAlertController {
    convenience init(title: String) {
        self.init(title: title, message: nil, preferredStyle: .alert)
        addAction(UIAlertAction(title: "Ok", style: .default))
    }
}

class AlertsFactory {
    func plainAlert(title: String, message: String? = nil) -> UIAlertController {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Ok", style: .default)
        alertController.addAction(action)
        return alertController
    }
}
