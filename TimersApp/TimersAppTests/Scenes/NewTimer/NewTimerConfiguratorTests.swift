//
//  NewTimerConfiguratorTests.swift
//  TimersAppTests
//
//  Created by Łukasz Bazior on 07/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

import XCTest
@testable import TimersApp

class NewTimerConfiguratorTests: XCTestCase {
    
    let service = DummyTimerService()
    let viewController = NewTimerViewController()
    let interactor = NewTimerInteractor()
    let presenter = NewTimerPresenter()
    let router = NewTimerRouter()
        
    let onDismiss: OnDismissCallback = { }
    
    override func setUp() {
        configure()
    }
    
    func test_didSet_viewController_presenter() {
        XCTAssertNotNil(viewController.presenter)
    }
    
    func test_didSet_interactor_service() {
        XCTAssertNotNil(interactor.service)
    }
    
    func test_didSet_interactor_delegate() {
        XCTAssertNotNil(interactor.delegate)
    }
    
    func test_didSet_presenter_router() {
        XCTAssertNotNil(presenter.router)
    }
    
    func test_didSet_presenter_interactor() {
        XCTAssertNotNil(presenter.interactor)
    }
        
    func test_didSet_router_viewController() {
        XCTAssertNotNil(router.viewController)
    }
    
    func test_didSet_router_onDismiss() {
        XCTAssertNotNil(router.onDismiss)
    }
    
    
    // MARK: - Helpers
    
    private func configure() {
        let _ = NewTimerConfigurator.configure(viewController: viewController, interactor: interactor, presenter: presenter, router: router, service: service, onDismiss: onDismiss)
    }
}
