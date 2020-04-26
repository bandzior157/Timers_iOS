//
//  FakeViewControllersFactory.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit
@testable import TimersApp

class FakeViewControllersFactory: ViewControllersFactory {
    private(set) var fakeNewTimerViewController = UIViewController()
    
    func newTimerViewController() -> UIViewController {
        fakeNewTimerViewController
    }
}
