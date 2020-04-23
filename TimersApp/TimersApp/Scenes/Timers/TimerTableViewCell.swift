//
//  TimerTableViewCell.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell {
    
    lazy var nameLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        return label
    }()
    
}

extension TimerTableViewCell {
    func set(for viewModel: TimerCellViewModel) {
        nameLabel.text = viewModel.nameText
        descriptionLabel.text = viewModel.descriptionText
    }
}
