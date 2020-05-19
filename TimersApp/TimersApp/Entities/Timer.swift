//
//  Timer.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 28/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import Foundation

class Timer {
    let id: String
    var title: String
    var body: String
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
        self.id = UUID().uuidString
    }
}

extension Timer: Equatable {
    static func == (lhs: Timer, rhs: Timer) -> Bool {
        lhs.title == rhs.title && lhs.body == rhs.body
    }
}
