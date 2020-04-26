//
//  UIBarButtonItem+Tapable.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UIBarButtonItem: Tapable {
    func tap() {
        let _ = target?.perform(action)
    }
}
