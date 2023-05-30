//
//  BaseViewModel.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Foundation

protocol IBaseViewModel { }

protocol BaseViewModelDelegate: AnyObject {
    func showLoading()
    func hideLoading()
    func showErrorMessage(message: String)
}
