//
//  NetworkUtils.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Foundation

enum APIEnvironment {
    case staging
    case dev
    case production
}

struct NetworkUtil {
    private static let environment: APIEnvironment = .dev

    static var environmentBaseURL: String {
        switch NetworkUtil.environment {
        case .production: return "https://jsonplaceholder.typicode.com"
        case .staging: return "https://jsonplaceholder.typicode.com"
        case .dev: return "https://jsonplaceholder.typicode.com"
        }
    }
}
