//
//  TimersViewController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

final class TimersListViewController: UITableViewController {
        
    var presenter: TimersListPresenting?
    var alertPresenter: SimpleAlertShowing? = SimpleAlertPresenter()

    private var timerViewModels = [TimerCellViewModel]() {
        didSet { tableView.reloadData() }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        title = "Timers"
        navigationController?.navigationBar.tintColor = .systemTeal

        setupTableView()
        setupAddButton()
        updateLeftBarButton(editingEnabled: false)
    }
    
    private func setupTableView() {
        tableView.tableFooterView = UIView()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newTimerButtonTapped))
    }
    
    @objc private func newTimerButtonTapped() {
        presenter?.didTapAddButton()
    }
    
    @objc private func editButtonTapped() {
        presenter?.didTapEditButton()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timerViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        TimerTableViewCell(viewModel: timerViewModels[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        presenter?.didSelectElement(at: indexPath.row)
    }
}

extension TimersListViewController: TimersListViewing {
    func updateEditingEnabled(_ editingEnabled: Bool) {
        updateLeftBarButton(editingEnabled: editingEnabled)
    }
    
    func update(viewModels: [TimerCellViewModel]) {
        timerViewModels = viewModels
    }
}

extension TimersListViewController: ErrorShowing {
    func show(message: String) {
        alertPresenter?.show(message: message, from: self)
    }
}

extension TimersListViewController {
    private func updateLeftBarButton(editingEnabled: Bool) {
        if editingEnabled {
            setLeftBarButtonAsOK()
        } else {
            setLeftBarButtonAsEdit()
        }
    }
    
    private func setLeftBarButtonAsOK() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(editButtonTapped))
    }
    
    private func setLeftBarButtonAsEdit() {
        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .edit, target: self, action: #selector(editButtonTapped))
    }
}
