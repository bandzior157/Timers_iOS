//
//  NewTimerValidationError.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 11/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

enum NewTimerValidationError: Error {
    case missingTitle
}

extension NewTimerValidationError: LocalizedError {
    public var errorDescription: String? {
       switch self {
       case .missingTitle:
           return "Please enter the title."
       }
    }
}
