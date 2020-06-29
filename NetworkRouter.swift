//
//  NetworkRouter.swift
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
//

import Foundation

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}
protocol NetworkRouter {
    var scheme: String {get}
    var host: String {get}
    var method: HTTPMethod {get}
    var path: String {get}
}

extension NetworkRouter {
    var scheme: String {
        return try! AppConfiguration.config(key:"URL_SCHEME")
    }

    var host: String {
        return try! AppConfiguration.config(key: "BASE_URL")
    }
}
