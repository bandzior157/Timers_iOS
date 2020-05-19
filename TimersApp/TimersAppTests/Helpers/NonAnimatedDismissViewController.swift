//
//  NonAnimatedDismissViewController.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NonAnimatedDismissViewController: UIViewController {
    private(set) var dismissCounter = 0
    
    override func dismiss(animated flag: Bool, completion: (() -> Void)? = nil) {
        dismissCounter += 1
        super.dismiss(animated: false, completion: completion)
    }
}
