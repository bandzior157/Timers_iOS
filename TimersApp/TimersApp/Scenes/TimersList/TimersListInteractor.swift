//
//  TimersListInteractor.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 28/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

final class TimersListInteractor: TimersListInteracting {
    var service: TimerServicing?
    weak var delegate: TimersListInteractingDelegate?

    func fetchTimers() {
        service?.fetch { [unowned self] result in
            self.handleResult(result)
        }
    }
    
    private func handleResult(_ result: Result<[Timer], Error>) {
        switch result {
        case .success(let timers):
            self.delegate?.timersListInteractor(self, didFinishWithTimers: timers)
        case .failure(let error):
            self.delegate?.timersListInteractor(self, didFailWithError: error)
        }
    }
}
