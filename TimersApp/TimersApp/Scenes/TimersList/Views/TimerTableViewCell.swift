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
        nil
    }
    
    private func labelsToStack() -> [UIView] {
        let allLabels = [nameLabel, descriptionLabel]
        return allLabels.filter { $0.text != "" }
    }
    
    private func setup() {
        let stackView = UIStackView(arrangedSubviews: labelsToStack())
        stackView.alignment = .leading
        stackView.axis = .vertical
        stackView.spacing = 4
        
        addSubview(stackView)
        bringSubviewToFront(stackView)
        
        layout(contentView: stackView)
    }
    
    private func layout(contentView view: UIView) {
        let constraints = anchorConstraints(view: view, in: safeAreaLayoutGuide, margins: Margins(vertical: 12, horizontal: 16))
        
        view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate(constraints)
    }
    
    private func anchorConstraints(view: UIView, in layoutGuide: UILayoutGuide, margins: Margins) -> [NSLayoutConstraint] {
        [view.topAnchor.constraint(equalTo: layoutGuide.topAnchor, constant: CGFloat(margins.top)),
         view.leftAnchor.constraint(equalTo: layoutGuide.leftAnchor, constant: CGFloat(margins.left)),
         view.rightAnchor.constraint(equalTo: layoutGuide.rightAnchor, constant: -CGFloat(margins.right)),
         view.bottomAnchor.constraint(equalTo: layoutGuide.bottomAnchor, constant: -CGFloat(margins.bottom))]
    }
    
}

extension TimerTableViewCell {
    convenience init(viewModel: TimerCellViewModel) {
        self.init()
        nameLabel.text = viewModel.nameText
        descriptionLabel.text = viewModel.descriptionText
        setup()
    }
}
