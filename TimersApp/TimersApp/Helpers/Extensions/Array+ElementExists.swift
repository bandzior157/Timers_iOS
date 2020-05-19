//
//  Array+ElementExists.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

extension Array where Element: Comparable {
    func exists(_ element: Element) -> Bool {
        (firstIndex(where: { $0 == element }) != nil)
    }
}
