//
//  DynamicTypeLabel.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 12/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class DynamicTypeLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setup() { }
    
}

extension DynamicTypeLabel {
    
    convenience init(frame: CGRect = .zero, text: String? = nil, textStyle: UIFont.TextStyle = .headline) {
        self.init(frame: frame)
        self.text = text
        self.font = .preferredFont(forTextStyle: textStyle)
    }
    
}
