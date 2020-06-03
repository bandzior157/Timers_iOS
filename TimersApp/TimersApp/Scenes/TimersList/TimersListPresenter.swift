//
//  TimersListPresenter.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

final class TimersListPresenter: TimersListPresenting {
    var router: TimersListRouting?
    var interactor: TimersListInteracting?
    weak var view: TimersListViewing?
        
    private var editingEnabled: Bool = false
    
    func viewDidLoad() {
        fetchTimers()
    }
    
    func didTapAddButton() {
        router?.routeToNewTimer {
            self.fetchTimers()
        }
    }
        
    func didTapEditButton() {
        editingEnabled.toggle()
        view?.updateEditingEnabled(editingEnabled)
    }
    
    func didSelectElement(at index: Int) {
        
    }
    
    private func fetchTimers() {
        interactor?.fetchTimers()
    }
    
    private func updateView(_ timers: [Timer]) {
        let viewModels = timers.map { TimerCellViewModel(timer: $0) }
        view?.update(viewModels: viewModels)
    }
}

extension TimersListPresenter: TimersListInteractingDelegate {
    func timersListInteractor(_ interactor: TimersListInteracting, didFinishWithTimers timers: [Timer]) {
        updateView(timers)
    }
    
    func timersListInteractor(_ interactor: TimersListInteracting, didFailWithError error: Error) {
        view?.show(message: error.localizedDescription)
    }
}
