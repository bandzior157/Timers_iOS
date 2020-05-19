//
//  MockAlertPresenter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 18/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit
@testable import TimersApp

class MockAlertPresenter: SimpleAlertShowing {
    private(set) var messages = [String]()
    
    func show(message: String, from viewController: UIViewController) {
        messages.append(message)
    }
}
