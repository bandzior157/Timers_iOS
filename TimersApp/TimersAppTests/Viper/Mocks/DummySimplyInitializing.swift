//
//  DummySimplyInitializing.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 07/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

final class DummySimplyInitializing: SimplyInitializing {}

extension DummySimplyInitializing: Equatable {
    static func == (lhs: DummySimplyInitializing, rhs: DummySimplyInitializing) -> Bool {
        ObjectIdentifier(lhs) == ObjectIdentifier(rhs)
    }
}
