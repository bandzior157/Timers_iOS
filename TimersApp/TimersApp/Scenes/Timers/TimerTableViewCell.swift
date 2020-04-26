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
        label.textColor = .label
        label.font = .preferredFont(forTextStyle: .headline)
        return label
    }()
    
    lazy var descriptionLabel: UILabel = {
        var label = UILabel()
        label.textColor = .secondaryLabel
        label.numberOfLines = 2
        label.font = .preferredFont(forTextStyle: .subheadline)
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        let stackView = UIStackView(arrangedSubviews: [nameLabel, descriptionLabel])
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        bringSubviewToFront(stackView)
        
        layout(contentView: stackView)
    }
    
    private func layout(contentView view: UIView) {
        let margin = CGFloat(8)
        let superView = safeAreaLayoutGuide
        
        view.translatesAutoresizingMaskIntoConstraints = false
        
        let constraints = [
            view.topAnchor.constraint(equalTo: superView.topAnchor, constant: margin),
            view.leftAnchor.constraint(equalTo: superView.leftAnchor, constant: margin),
            view.rightAnchor.constraint(equalTo: superView.rightAnchor, constant: -margin),
            view.bottomAnchor.constraint(equalTo: superView.bottomAnchor, constant: -margin)
        ]
        
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension TimerTableViewCell {
    func set(for viewModel: TimerCellViewModel) {
        nameLabel.text = viewModel.nameText
        descriptionLabel.text = viewModel.descriptionText
    }
}
