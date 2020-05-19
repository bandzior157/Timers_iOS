//
//  MockError.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 10/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

enum MockError: LocalizedError {
    case someError
    
    var errorDescription: String? {
        switch self {
        case .someError:
            return "some error"
        }
    }
}
