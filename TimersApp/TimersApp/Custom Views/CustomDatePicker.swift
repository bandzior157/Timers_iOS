//
//  CustomDatePicker.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 10/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import UIKit

class CustomDatePicker: UIPickerView, UIPickerViewDataSource, UIPickerViewDelegate {
    
    private let componentsRows = [24, 60, 60]
    private let suffixes = [" h", " min", " s"]

    override init(frame: CGRect) {
        super.init(frame: frame)
        self.delegate = self
        self.dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        componentsRows.count
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        componentsRows.getElement(at: component) ?? 0
    }
    
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let mutable = NSMutableAttributedString()

        let first = NSAttributedString(string: "\(row)", attributes: [NSAttributedString.Key : Any]())
        mutable.append(first)

        let second = NSAttributedString(string: getSuffix(forComponent: component), attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray, NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10, weight: .bold)])
        mutable.append(second)

        return mutable
    }
    
    private func getSuffix(forComponent component: Int) -> String {
        suffixes.getElement(at: component) ?? ""
    }
    
}

extension CustomDatePicker {
   
//    func setFixedLabels(containedView: UIView) {
//        let fontSize: CGFloat = 20
//        let labelWidth: CGFloat = containedView.bounds.width / CGFloat(self.numberOfComponents)
//        let x: CGFloat = self.frame.origin.x
//        let y: CGFloat = (self.frame.size.height / 2) - (fontSize / 2)
//
//        for i in 0...self.numberOfComponents {
//            let text = getSuffix(forComponent: i)
//
//            let label = UILabel()
//            label.frame = CGRect(x: x + labelWidth * CGFloat(i), y: y, width: labelWidth, height: fontSize)
//            label.font = UIFont.boldSystemFont(ofSize: fontSize)
//            label.backgroundColor = .clear
//            label.textAlignment = NSTextAlignment.center
//            label.text = text
//            self.addSubview(label)
//        }
//    }
}
