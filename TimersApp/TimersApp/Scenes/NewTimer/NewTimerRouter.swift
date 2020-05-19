//
//  NewTimerRouter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

final class NewTimerRouter: NewTimerRouting {
    weak var viewController: UIViewController?
    var onDismiss: OnDismissCallback?
    
    func closePresentedViewController() {
        viewController?.dismiss(animated: true, completion: onDismiss)
    }
}
