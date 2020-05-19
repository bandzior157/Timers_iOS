//
//  TimerServicingError.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

enum TimerServicingError: Error {
    case timerAlreadyExists
    case timerNotFound
}

extension TimerServicingError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .timerNotFound:
            return "Timer not found"
        case .timerAlreadyExists:
            return "Timer already exists"
        }
    }
}
