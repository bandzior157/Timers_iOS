//
//  ViperConfiguratingModel.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 07/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class ViperConfiguratingModelTests: XCTestCase {
    
    func test_defaultInit_initializeAllProperties() {
        let sut = ViperConfiguratingModel<DummySimplyInitializing, DummySimplyInitializing, DummySimplyInitializing, DummySimplyInitializing>()
        XCTAssertNotNil(sut.viewController)
        XCTAssertNotNil(sut.interactor)
        XCTAssertNotNil(sut.presenter)
        XCTAssertNotNil(sut.router)
    }
    
    func test_init_allProperties() {
        let dummyViewController = DummySimplyInitializing()
        let dummyInteractor = DummySimplyInitializing()
        let dummyPresenter = DummySimplyInitializing()
        let dummyRouter = DummySimplyInitializing()

        let sut = ViperConfiguratingModel(viewController: dummyViewController, interactor: dummyInteractor, presenter: dummyPresenter, router: dummyRouter)
        
        XCTAssertEqual(sut.viewController, dummyViewController)
        XCTAssertEqual(sut.interactor, dummyInteractor)
        XCTAssertEqual(sut.presenter, dummyPresenter)
        XCTAssertEqual(sut.router, dummyRouter)
    }
    
}
