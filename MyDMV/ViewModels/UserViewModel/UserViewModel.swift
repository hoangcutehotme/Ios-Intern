//
//  UserViewModel.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Foundation

protocol UserViewModelDelegate: BaseViewModelDelegate {
    
    func readedUser()
    func createdUser(index: Int)
    func updatedUser(indexPath: IndexPath)
    func deletedUser(indexPath: IndexPath)
}

class UserViewModel: IBaseViewModel {
    private var users = [User]()

    let userManager: UserManager
    var delegate: UserViewModelDelegate?

    init(userManager: UserManager) {
        self.userManager = userManager
    }
    
    func readUser() {
        self.delegate?.showLoading()
        userManager.readUsers { (users, error) in
            self.delegate?.hideLoading()
            if let error = error {
                self.delegate?.showErrorMessage(message: error.localizedDescription)
            }

            self.users = users!
            self.delegate?.readedUser()
        }
    }
    
    func createUser(name: String) {
        self.delegate?.showLoading()
        userManager.createUser(name: name) { (newUser, error) in
            self.delegate?.hideLoading()
            if let error = error {
                self.delegate?.showErrorMessage(message: error.localizedDescription)
            }

            self.users.insert(newUser!, at: 0)
            self.delegate?.createdUser(index: 0)
        }
    }

    func updateUser(indexPath: IndexPath, id: Int, name: String) {
        self.delegate?.showLoading()
        userManager.updateUser(id: id, name: name) { (modifiedUser, error) in
            self.delegate?.hideLoading()
            if let error = error {
                self.delegate?.showErrorMessage(message: error.localizedDescription)
            }

            self.users[indexPath.row] = modifiedUser!
            self.delegate?.updatedUser(indexPath: indexPath)
        }
    }

    func deleteUser(indexPath: IndexPath, id: Int) {
        self.delegate?.showLoading()
        userManager.deleteUser(id: id) { (error) in
            self.delegate?.hideLoading()
            if let error = error {
                self.delegate?.showErrorMessage(message: error.localizedDescription)
            }
            self.users.remove(at: indexPath.row)
            self.delegate?.deletedUser(indexPath: indexPath)
        }
    }
    
    func numberOfRowsInSection() -> Int {
        return users.count
    }

    func getUser(at index: Int) -> User {
        return users[index]
    }

    func getUserName(at index: Int) -> String {
        return getUser(at: index).name
    }
}
