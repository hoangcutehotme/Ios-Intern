//
//  UserViewModelFactory.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Moya

class UserViewModelFactory: ViewModelFactory {
    typealias Target = UserService
    typealias M = UserManager
    typealias V = UserViewModel
    
    func makeProvider() -> MoyaProvider<UserService> {
        return createMoyaProvider(targetType: UserService.self)
    }
    
    func makeManager() -> UserManager {
        return UserManager(userProvider: makeProvider())
    }
    
    func makeViewModel() -> UserViewModel {
        return UserViewModel(userManager: makeManager())
    }
    
}
