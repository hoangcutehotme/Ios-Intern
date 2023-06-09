//
//  UserManager.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Moya

protocol UserProtocol {
    func readUsers(completion: @escaping ([User]?, Error?) -> Void)
    func createUser(name: String, completion: @escaping (User?, Error?) -> Void)
    func updateUser(id: Int, name: String, completion: @escaping (User?, Error?) -> Void)
    func deleteUser(id: Int, completion: @escaping (Error?) -> Void)
}

class UserManager: BaseManager <UserService, MoyaProvider<UserService>>, UserProtocol {
    
    init(userProvider: MoyaProvider<UserService>) {
        super.init(provider: userProvider)
    }
    
    func readUsers(completion: @escaping ([User]?, Error?) -> Void) {
        mRequest(.readUsers, callback: completion)
    }
    
    func createUser(name: String, completion: @escaping (User?, Error?) -> Void) {
        mRequest(.createUser(name: name), callback: completion)
    }
    
    func updateUser(id: Int, name: String, completion: @escaping (User?, Error?) -> Void) {
        mRequest(.updateUser(id: id, name: "[Modified] \(name)"), callback: completion)
    }
    
    func deleteUser(id: Int, completion: @escaping (Error?) -> Void) {
        mRequest(.deleteUser(id: id), callback: completion)
    }
}
