//
//  TimersViewController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class TimersListViewController: UITableViewController {
        
    var presenter: TimersListPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Timers"
        
        setupAddButton()
    }
    
    private func setupAddButton() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(newTimerButtonTapped))
    }
    
    @objc private func newTimerButtonTapped() {
        presenter?.newTimerButtonClicked()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        3
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = TimerTableViewCell()
        cell.set(for: TimerCellViewModel(nameText: "Timer name", descriptionText: "Short timer's description placed below title. Also with secondaryLabel font color to separate it from title."))
        return cell
    }
    
}
