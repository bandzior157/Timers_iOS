//
//  Result.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

enum Result<T, Error> {
    case success(T)
    case failure(Error)
}
