//
//  TimerCellViewModel.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 23/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

struct TimerCellViewModel {
    var nameText: String
    var descriptionText: String
    
    init(timer: Timer) {
        self.nameText = timer.title
        self.descriptionText = timer.body
    }
}
