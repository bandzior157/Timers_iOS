//
//  NewTimerInteractor.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 03/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

final class NewTimerInteractor: NewTimerInteracting {
    var service: TimerServicing?
    weak var delegate: NewTimerInteractingDelegate?
    
    func addTimer(_ timerPresentationModel: TimerPresentationModel) {
        do {
            try validate(timerPresentationModel)
            
            service?.addTimer(timerPresentationModel, completion: { [unowned self] result in
                self.handleResult(result)
            })
        } catch let error {
            self.delegate?.newTimerInteractor(self, didFailWithError: error)
        }
    }
    
    private func handleResult(_ result: Result<[Timer], Error>) {
        switch result {
        case .success(let timers):
            delegate?.newTimerInteractor(self, didFinishWithTimers: timers)
        case .failure(let error):
            delegate?.newTimerInteractor(self, didFailWithError: error)
        }
    }
}

extension NewTimerInteractor {
    private func validate(_ model: TimerPresentationModel) throws {
        if model.title == "" {
            throw NewTimerValidationError.missingTitle
        }
    }
}
