//
//  BaseManager.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Foundation
import Moya

protocol IBaseManager {

}

class BaseManager<Target: TargetType, Provider: MoyaProvider<Target>>: IBaseManager {

    private var provider: Provider

    init(provider: Provider) {
        self.provider = provider
    }

    func mRequest<T: Codable>(_ target: Target, callback: @escaping (T?, Error?) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(let response):
                do {
                    let users = try JSONDecoder().decode(T.self, from: response.data)
                    callback(users, nil)
                } catch (let error) {
                    callback(nil, error)
                }
            case .failure(let error):
                callback(nil, error)
            }
        }
    }

    func mRequest(_ target: Target, callback: @escaping (Error?) -> Void) {
        provider.request(target) { (result) in
            switch result {
            case .success(_):
                callback(nil)
            case .failure(let error):
                callback(error)
            }
        }
    }
}
