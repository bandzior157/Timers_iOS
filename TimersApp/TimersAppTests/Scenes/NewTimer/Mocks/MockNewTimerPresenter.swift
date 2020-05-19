//
//  MockNewTimerPresenter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockNewTimerPresenter: NewTimerPresenting {
    private(set) var cancelCounter = 0
    private(set) var saveCounter = 0
    private(set) var titleChangedCounter = 0
    private(set) var descriptionChangedCounter = 0

    func cancel() {
        cancelCounter += 1
    }
    
    func save() {
        saveCounter += 1
    }
    
    func titleChanged(_ string: String) {
        titleChangedCounter += 1
    }
    
    func descriptionChanged(_ string: String) {
        descriptionChangedCounter += 1
    }
}
