//
//  ViewControllerFactoryInterface.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 05/06/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol ViewControllerFactoryInterface {
    func newTimerViewController() -> NewTimerViewController
    func editTimerViewController(for timer: Timer) -> NewTimerViewController
    func timersListViewController() -> TimersListViewController
}
