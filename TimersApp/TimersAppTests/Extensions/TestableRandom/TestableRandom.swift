//
//  TestableRandom.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol TestableRandom {
    static var testableRandom: Self { get }
}
