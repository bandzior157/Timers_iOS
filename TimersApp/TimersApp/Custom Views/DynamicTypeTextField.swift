//
//  DynamicTypeTextField.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 12/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class DynamicTypeTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        nil
    }
    
    private func setup() {
        borderStyle = .roundedRect
    }
    
}

extension DynamicTypeTextField {
    
    convenience init(frame: CGRect = .zero, text: String? = nil, placeholder: String? = nil, textStyle: UIFont.TextStyle = .body) {
        self.init(frame: frame)
        self.text = text
        self.placeholder = placeholder
        self.font = .preferredFont(forTextStyle: textStyle)
    }
    
}
