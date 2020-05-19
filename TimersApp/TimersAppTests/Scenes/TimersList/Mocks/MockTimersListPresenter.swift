//
//  MockTimersListPresenter.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 26/04/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

@testable import TimersApp

class MockTimersListPresenter: TimersListPresenting {
    private(set) var didTapAddButtonCounter = 0
    
    func viewDidLoad() {}
    
    func didTapAddButton() {
        didTapAddButtonCounter += 1
    }
}
