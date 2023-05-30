//
//  ViewModelFactory.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Moya

protocol ViewModelFactory {

    associatedtype Target: TargetType
    associatedtype M: IBaseManager
    associatedtype V: IBaseViewModel

    func makeProvider() -> MoyaProvider<Target>
    func makeManager() -> M
    func makeViewModel() -> V
}

extension ViewModelFactory {
    func createMoyaProvider<Target: TargetType>(targetType: Target.Type) -> MoyaProvider<Target> {
        let provider = MoyaProvider<Target>(plugins: [NetworkLoggerPlugin()])
        provider.session.sessionConfiguration.timeoutIntervalForRequest = 120
        return provider
    }
}
