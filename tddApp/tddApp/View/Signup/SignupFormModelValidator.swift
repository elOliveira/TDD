//
//  SignupFormModelValidator.swift
//  tddApp
//
//  Created by cit on 22/06/22.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool{
        let firsNameIsValid: Bool = firstName.isEmpty ? false : true
        
        return firsNameIsValid
    }
}
