//
//  SignupFormRequestModel.swift
//  tddApp
//
//  Created by cit on 23/06/22.
//

import Foundation

struct SignupFormRequestModel: Encodable{
    let firstName: String
    let lastName:  String
    let email:     String
    let password:  String
}
