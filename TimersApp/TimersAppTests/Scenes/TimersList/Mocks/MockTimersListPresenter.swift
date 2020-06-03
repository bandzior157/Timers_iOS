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
    private(set) var didTapEditButtonCounter = 0
    private(set) var selectedElementIndexes = [Int]()
    
    func viewDidLoad() {}
    
    func didTapAddButton() {
        didTapAddButtonCounter += 1
    }
    
    func didTapEditButton() {
        didTapEditButtonCounter += 1
    }
    
    func didSelectElement(at index: Int) {
        selectedElementIndexes.append(index)
    }
}
