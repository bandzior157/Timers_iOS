//
//  NewTimerPresenter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol NewTimerPresenter {
    func cancel()
    func save()
    func nameChanged(_ string: String)
    func descriptionChanged(_ string: String)
}

class TheNewTimerPresenter: NewTimerPresenter {
    var router: NewTimerRouter?
    
    private var timer = NewTimer()
    
    func cancel() {
        router?.closePresentedViewController()
    }
    
    func save() {
        print("Trying to save timer with name: \(timer.name) and description: \(timer.description)")
    }
    
    func nameChanged(_ string: String) {
        timer.name = string
    }
    
    func descriptionChanged(_ string: String) {
        timer.description = string
    }
}

struct NewTimer {
    var name: String
    var description: String
    
    init() {
        self.name = ""
        self.description = ""
    }
}
