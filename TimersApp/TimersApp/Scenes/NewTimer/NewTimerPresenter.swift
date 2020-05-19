//
//  NewTimerPresenter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 27/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

final class NewTimerPresenter: NewTimerPresenting {
    var router: NewTimerRouting?
    var interactor: NewTimerInteracting?
    var view: NewTimerViewing?
    
    private var timer = TimerPresentationModel()
    
    func cancel() {
        router?.closePresentedViewController()
    }
        
    func save() {
        interactor?.addTimer(timer)
    }

    func titleChanged(_ string: String) {
        timer.title = string
    }

    func descriptionChanged(_ string: String) {
        timer.body = string
    }
}

extension NewTimerPresenter: NewTimerInteractingDelegate {
    func newTimerInteractor(_ interactor: NewTimerInteracting, didFinishWithTimers timers: [Timer]) {
        router?.closePresentedViewController()
    }
    
    func newTimerInteractor(_ interactor: NewTimerInteracting, didFailWithError error: Error) {
        view?.show(message: error.localizedDescription)
    }
}
