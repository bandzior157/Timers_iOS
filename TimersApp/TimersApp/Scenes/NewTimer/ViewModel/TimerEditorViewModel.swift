//
//  TimerEditorViewModel.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 04/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class TimerEditorViewModel {
    let title: String?
    let timerTitleText: String?
    let timerBodyText: String?
    
    init(title: String? = nil, timerTitleText: String? = nil, timerBodyText: String? = nil) {
        self.title = title
        self.timerTitleText = timerTitleText
        self.timerBodyText = timerBodyText
    }
}

extension TimerEditorViewModel: Equatable {
    
    static func == (lhs: TimerEditorViewModel, rhs: TimerEditorViewModel) -> Bool {
        lhs.title == rhs.title &&
            lhs.timerTitleText == rhs.timerTitleText &&
            lhs.timerBodyText == rhs.timerBodyText
    }
    
}
