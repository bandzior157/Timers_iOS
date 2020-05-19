//
//  MockNewTimerInteractor.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 12/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockNewTimerInteractor: NewTimerInteracting {
    private(set) var addedTimers = [TimerPresentationModel]()
    
    func addTimer(_ timerPresentationModel: TimerPresentationModel) {
        addedTimers.append(timerPresentationModel)
    }
}
