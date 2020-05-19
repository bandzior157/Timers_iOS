//
//  TimerServicing.swift
//  TimersApp
//
//  Created by Łukasz Bazior on 06/05/2020.
//  Copyright © 2020 Łukasz Bazior. All rights reserved.
//

protocol TimerServicing {
    typealias ResultType = Result<[Timer], Error>
    func fetch(completion: @escaping (_ result: ResultType) -> ())
    func addTimer(_ timer: TimerPresentationModel, completion: @escaping (_ result: ResultType) -> Void)
    func delete(_ timerId: String, completion: @escaping (_ result: ResultType) -> Void)
}
