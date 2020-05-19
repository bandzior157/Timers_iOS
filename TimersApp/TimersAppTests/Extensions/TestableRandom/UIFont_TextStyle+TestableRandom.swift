//
//  UIFont_TextStyle+TestableRandom.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 13/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

extension UIFont.TextStyle: TestableRandom {
    static var testableRandom: UIFont.TextStyle {
        allCases.randomElement() ?? .callout
    }
    
    private static let allCases: [UIFont.TextStyle] = [.body, .callout, .caption1, .caption2, .footnote, .headline, .largeTitle, .subheadline, .title1, .title2, .title3]
}
