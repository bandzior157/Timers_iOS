//
//  TimerPresentationFactory.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class TimerPresentationFactory {
    private let title: String
    private let body: String
    
    init(title: String, body: String) {
        self.title = title
        self.body = body
    }
}

extension TimerPresentationFactory {
    func getTimer() -> TimersApp.Timer {
        TimersApp.Timer(title: title, body: body)
    }
}

extension TimerPresentationFactory {
    func getTimerPresentationModel() -> TimerPresentationModel {
        TimerPresentationModel(title: title, body: body)
    }
}
