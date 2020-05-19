//
//  TimerService.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 19/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

class TimerService {
    static var shared = StaticTimerService(timers: [Timer(title: "Timer #1", body: "First timer from static service."), Timer(title: "Timer #2", body: "Next timer from static service."), Timer(title: "Default timer without description", body: "")])
}
