//
//  MockTimerService.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 10/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimerService: TimerServicing {
    
    private var resultType: ResultType
    
    init(resultType: ResultType) {
        self.resultType = resultType
    }
        
    func fetch(completion: @escaping (ResultType) -> ()) {
        completion(resultType)
    }
    
    func addTimer(_ timer: TimerPresentationModel, completion: @escaping (ResultType) -> Void) {
        completion(resultType)
    }
    
    func delete(_ timerId: String, completion: @escaping (ResultType) -> Void) {        completion(resultType)
    }
}
