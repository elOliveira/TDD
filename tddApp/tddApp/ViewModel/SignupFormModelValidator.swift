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
        let maximumLengthName:Int = 10
        let firstNameIsValid: Bool = ((firstName.count > minimumLengthName) && (firstName.count < maximumLengthName))  ? true : false
        
        return firstNameIsValid
    }
}
