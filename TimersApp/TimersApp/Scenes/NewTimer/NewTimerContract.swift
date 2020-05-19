//
//  NewTimerContract.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 28/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol NewTimerViewing: ErrorShowing {}

protocol NewTimerInteracting {
    func addTimer(_ timerPresentationModel: TimerPresentationModel)
}

protocol NewTimerInteractingDelegate: class {
    func newTimerInteractor(_ interactor: NewTimerInteracting, didFinishWithTimers timers: [Timer])
    func newTimerInteractor(_ interactor: NewTimerInteracting, didFailWithError error: Error)
}

protocol NewTimerPresenting {
    func cancel()
    func save()
    func titleChanged(_ string: String)
    func descriptionChanged(_ string: String)
}

protocol NewTimerRouting {
    func closePresentedViewController()
}
