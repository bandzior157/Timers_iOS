//
//  TimerPresentationModel+Equatable.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

extension TimerPresentationModel: Equatable {
    public static func == (lhs: TimerPresentationModel, rhs: TimerPresentationModel) -> Bool {
        lhs.title == rhs.title && lhs.body == rhs.body
    }
}
