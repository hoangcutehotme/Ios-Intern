//
//  UserService.swift
//  BaseMVVM
//
//  Created by Finofantashi on 15/08/2022.
//

import Moya

enum UserService {
    case createUser(name: String)
    case readUsers
    case updateUser(id: Int, name: String)
    case deleteUser(id: Int)
}

extension UserService: TargetType {

    var baseURL: URL {
        guard let url = URL(string: NetworkUtil.environmentBaseURL) else { fatalError("baseURL could not be configured") }
        return url
    }

    var path: String {
        switch self {
        case .readUsers, .createUser(_):
            return "/users"
        case .updateUser(let id, _), .deleteUser(let id):
            return "/users/\(id)"
        }
    }

    var method: Moya.Method {
        switch self {
        case .createUser(_):
            return .post
        case .readUsers:
            return .get
        case .updateUser(_, _):
            return .put
        case .deleteUser(_):
            return .delete
        }
    }

    var task: Task {
        switch self {
        case .readUsers, .deleteUser(_):
            return .requestPlain
        case .createUser(let name):
            return .requestParameters(parameters: ["name": name], encoding: JSONEncoding.default)
        case .updateUser(let id, let name):
            return .requestParameters(parameters: ["id": id, "name": name], encoding: JSONEncoding.default)
        }
    }

    var headers: [String: String]? {
        return ["Content-Type": "application/json"]
    }
}
