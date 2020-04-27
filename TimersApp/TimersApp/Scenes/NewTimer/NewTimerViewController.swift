//
//  NewTimerViewController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class NewTimerViewController: UIViewController {
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        label.text = "Name"
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.text = "Description"
        return label
    }()
    
    lazy var nameTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Name"
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    lazy var descriptionTextField: UITextField = {
        var textField = UITextField()
        textField.placeholder = "Description"
        textField.borderStyle = .roundedRect
        textField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        return textField
    }()
    
    var presenter: TheNewTimerPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        
        title = "New timer"
        setupSaveButton()
        setupCancelButton()
        setupContentViews()
    }
    
    @objc private func textFieldDidChange(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        switch textField {
        case nameTextField:
            presenter?.timerNameChanged(text)
        case descriptionTextField:
            presenter?.timerDescriptionChanged(text)
        default:
            return
        }
    }
    
    private func setupContentViews() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, nameTextField, descriptionLabel, descriptionTextField])
        stackView.alignment = .fill
        stackView.axis = .vertical
        stackView.spacing = 4
        
        view.addSubview(stackView)
        view.bringSubviewToFront(stackView)
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
        let layoutGuide = view.safeAreaLayoutGuide
        let margin = CGFloat(12)
        
        let constraints = [
            stackView.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: margin),
            stackView.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: margin),
            stackView.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -margin),
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
    private func setupCancelButton() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: presenter, action: #selector(presenter?.cancelButtonHandler))
    }
    
    private func setupSaveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
    }
    
}
