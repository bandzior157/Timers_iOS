//
//  NewTimerViewControllerTextFieldsController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 04/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NewTimerViewControllerTextFieldsController: NSObject, UITextFieldDelegate {
    private var presenter: NewTimerPresenting?
    private let titleTextField: UITextField
    private let descriptionTextField: UITextField
    
    init(presenter: NewTimerPresenting?, titleTextField: UITextField, descriptionTextField: UITextField) {
        self.presenter = presenter
        self.titleTextField = titleTextField
        self.descriptionTextField = descriptionTextField
        
        super.init()
        
        setup()
    }
    
    private func setup() {
        titleTextField.delegate = self
        descriptionTextField.delegate = self
        
        titleTextField.returnKeyType = .next
        descriptionTextField.returnKeyType = .done
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch textField {
        case titleTextField:
            presenter?.titleChanged(text)
        case descriptionTextField:
            presenter?.descriptionChanged(text)
        default:
            return
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        switch textField {
        case titleTextField:
            descriptionTextField.becomeFirstResponder()
            return true
        case descriptionTextField:
            textField.endEditing(true)
            return false
        default:
            return false
        }
    }
}
