//
//  Timer+CustomStringConvertible.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

extension TimersApp.Timer: CustomStringConvertible {
    public var description: String {
        "[Timer] Title:\(title), Description:\(body)"
    }
}
