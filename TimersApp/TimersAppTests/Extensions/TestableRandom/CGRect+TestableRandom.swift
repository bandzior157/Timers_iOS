//
//  CGRect+TestableRandom.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension CGRect: TestableRandom {
    static var testableRandom: CGRect {
        CGRect(x: Int.testableRandom, y: Int.testableRandom, width: Int.testableRandom, height: Int.testableRandom)
    }
}
