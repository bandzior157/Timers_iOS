//
//  TimersListPresenter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol TimersListPresenter {
    func newTimerButtonClicked()
}

class TheTimersListPresenter: TimersListPresenter {
    var router: TimersListRouter?
    
    func newTimerButtonClicked() {
        router?.routeToNewTimer()
    }
}
