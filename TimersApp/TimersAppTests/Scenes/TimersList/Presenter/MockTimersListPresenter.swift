//
//  MockTimersListPresenter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListPresenter: TimersListPresenter {
    private(set) var newTimerButtonClickedCounter = 0
    
    func newTimerButtonClicked() {
        newTimerButtonClickedCounter += 1
    }
}
