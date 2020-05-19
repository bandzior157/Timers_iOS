//
//  String+TestableRandom.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

extension String: TestableRandom {
    static var testableRandom: String {
        String((0..<10).map{ _ in alphanumericsString.randomElement()! })
    }
    
    private static let alphanumericsString = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
}
