//
//  TimersListContract.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 28/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

typealias TimerResult = Result<[Timer], Error>

protocol TimersListViewing: class, ErrorShowing {
    func update(viewModels: [TimerCellViewModel])
    func updateEditingEnabled(_ flag: Bool)
}

protocol TimersListInteracting: class {
    func fetchTimers()
}

protocol TimersListInteractingDelegate: class {
    func timersListInteractor(_ interactor: TimersListInteracting, didFinishWithTimers timers: [Timer])
    func timersListInteractor(_ interactor: TimersListInteracting, didFailWithError error: Error)
}

protocol TimersListPresenting: class {
    func viewDidLoad()
    func didTapAddButton()
    func didTapEditButton()
    func didSelectElement(at index: Int)
}

typealias OnDismissCallback = ( () -> () )
protocol TimersListRouting: class {
    func route(to timer: Timer)
    func routeToNewTimer(_ onDismiss: OnDismissCallback?)
}
