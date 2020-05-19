//
//  MockNewTimerView.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 12/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockNewTimerView: NewTimerViewing {
    private(set) var showedMessages = [String]()
    
    func show(message: String) {
        showedMessages.append(message)
    }
}
