//
//  TimersViewController.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class TimersViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        title = "Timers"
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
