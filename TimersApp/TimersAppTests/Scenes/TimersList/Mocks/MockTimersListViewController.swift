//
//  MockTimersListViewController.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 04/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListViewController: TimersListViewing {
    private(set) var updateCounter = 0
    private(set) var showedMessages = [String]()
    
    func update(viewModels: [TimerCellViewModel]) {
        updateCounter += 1
    }
    
    func show(message: String) {
        showedMessages.append(message)
    }
}
