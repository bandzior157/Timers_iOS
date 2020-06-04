//
//  NewTimerViewController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

final class NewTimerViewController: UIViewController, NewTimerViewing {
    
    lazy var titleLabel = DynamicTypeLabel(text: "Title")
    lazy var descriptionLabel = DynamicTypeLabel(text: "Description")
    
    lazy var titleTextField = DynamicTypeTextField(placeholder: "Enter title")
    lazy var descriptionTextField = DynamicTypeTextField(placeholder: "Description")
    
    var textFieldsController: NewTimerViewControllerTextFieldsController?
    var presenter: NewTimerPresenting?
    var alertPresenter: SimpleAlertShowing? = SimpleAlertPresenter()
    
    init(viewModel: NewTimerViewViewModel? = nil) {
        super.init(nibName: nil, bundle: nil)
        guard let viewModel = viewModel else { return }
        self.title = viewModel.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        navigationController?.navigationBar.tintColor = .systemTeal
        
        setupSaveButton()
        setupCancelButton()
        setupContentViews()
        setupKeyboardDismiss()
                
        textFieldsController = NewTimerViewControllerTextFieldsController(presenter: presenter, titleTextField: titleTextField, descriptionTextField: descriptionTextField)
    }
    
    private func setupContentViews() {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, titleTextField, descriptionLabel, descriptionTextField])
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
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonDidTapped))
    }
    
    private func setupSaveButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .save, target: self, action: #selector(saveButtonDidTapped))
    }
    
    private func setupKeyboardDismiss() {
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        view.addGestureRecognizer(tapGestureRecognizer)
    }
    
    @objc private func cancelButtonDidTapped() {
        presenter?.cancel()
    }
    
    @objc private func saveButtonDidTapped() {
        dismissKeyboard()
        presenter?.save()
    }
    
    @objc private func dismissKeyboard() {
        view.endEditing(true)
    }
}

extension NewTimerViewController: ErrorShowing {
    func show(message: String) {
        alertPresenter?.show(message: message, from: self)
    }
}
