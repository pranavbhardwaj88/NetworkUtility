//
//  Config.swift
//  WeatherApp
//
//  Created by Pranav Bhardwaj on 03/05/20.
//  Copyright © 2020 Pranav Bhardwaj. All rights reserved.
// https://nshipster.com/xcconfig/

import Foundation

public enum AppConfiguration{
    
    enum AppError: Swift.Error {
        case keyNotAvailable(_ key:String), invalidValue
    }

    static func config<T>(key: String) throws -> T where T: LosslessStringConvertible {
        guard let object = Bundle.main.object(forInfoDictionaryKey:key) else {
            throw AppError.keyNotAvailable(key)
        }

        switch object {
        case let value as T:
            return value
        case let string as String:
            guard let value = T(string) else { fallthrough }
            return value
        default:
            throw AppError.invalidValue
        }
    }
    
}
