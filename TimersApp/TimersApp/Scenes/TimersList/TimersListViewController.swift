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
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timerViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        TimerTableViewCell(viewModel: timerViewModels[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TimersListViewController: TimersListViewing {
    func update(viewModels: [TimerCellViewModel]) {
        timerViewModels = viewModels
    }
}

extension TimersListViewController: ErrorShowing {
    func show(message: String) {
        alertPresenter?.show(message: message, from: self)
    }
}
