//
//  MockNewTimerPresenter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockNewTimerPresenter: NewTimerPresenter {
    private(set) var cancelCounter = 0
    private(set) var saveCounter = 0

    func cancel() {
        cancelCounter += 1
    }
    
    func save() {
        saveCounter += 1
    }
    
    func nameChanged(_ string: String) {
        
    }
    
    func descriptionChanged(_ string: String) {
        
    }
}
