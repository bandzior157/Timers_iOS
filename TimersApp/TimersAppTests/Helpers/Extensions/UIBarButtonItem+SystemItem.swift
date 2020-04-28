//
//  UIBarButtonItem+SystemItem.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    var systemItem: SystemItem? {
        let rawValue = value(forKey: "systemItem") as! Int
        return UIBarButtonItem.SystemItem(rawValue: rawValue)
    }
}
