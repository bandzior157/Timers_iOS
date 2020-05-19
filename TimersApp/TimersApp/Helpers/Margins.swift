//
//  Margins.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 04/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct Margins {
    var top: Float
    var bottom: Float
    var left: Float
    var right: Float
    
    init(vertical: Float, horizontal: Float) {
        top = vertical
        bottom = vertical
        left = horizontal
        right = horizontal
    }
}
