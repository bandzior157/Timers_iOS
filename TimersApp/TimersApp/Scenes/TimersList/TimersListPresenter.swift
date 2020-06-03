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
        
    private var editingEnabled: Bool = false {
        didSet {
            view?.updateEditingEnabled(editingEnabled)
        }
    }
    
    private var timers = [Timer]()
    
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
    }
    
    func didSelectElement(at index: Int) {
        if editingEnabled {
            guard let timer = timers.getElement(at: index) else { return }
            router?.route(to: timer)
        }
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
        self.timers = timers
        updateView(timers)
    }
    
    func timersListInteractor(_ interactor: TimersListInteracting, didFailWithError error: Error) {
        view?.show(message: error.localizedDescription)
    }
}
