//
//  TimerResult+Equatable.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

extension TimerResult: Equatable {
    public static func == (lhs: Result<T, Error>, rhs: Result<T, Error>) -> Bool {
        switch (lhs, rhs) {
        case (.failure(let lError), .failure(let rError)):
            return lError.localizedDescription == rError.localizedDescription
        case (.success(let l), .success(let r)):
            return l == r
        default:
            return false
        }
    }
}
