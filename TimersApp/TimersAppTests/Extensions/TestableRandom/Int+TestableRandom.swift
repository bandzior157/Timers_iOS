//
//  Int+TestableRandom.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

extension Int: TestableRandom {
    static var testableRandom: Int {
        Int.random(in: 0...100)
    }
}
