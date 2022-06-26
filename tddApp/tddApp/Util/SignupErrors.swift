//
//  SignupErrors.swift
//  tddApp
//
//  Created by cit on 23/06/22.
//

import Foundation

enum SignupErro: LocalizedError, Equatable{
    case invalidResponseModel
    case invalidRequestURLString
    case failedRequest(description:String)
    
    var errorDescription: String? {
        switch self {
        case .failedRequest(let description):
            return description
        case .invalidResponseModel,.invalidRequestURLString:
            return ""
        }
    }
    
}
