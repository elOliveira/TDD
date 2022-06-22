//
//  SignupFormModelValidator.swift
//  tddApp
//
//  Created by cit on 22/06/22.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool{
        let minimumLengthName:Int = 2
        let firsNameIsValid: Bool = firstName.count < minimumLengthName ? false : true
        
        return firsNameIsValid
    }
}
