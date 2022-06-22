//
//  SignupFormModelValidator.swift
//  tddApp
//
//  Created by cit on 22/06/22.
//

import Foundation

class SignupFormModelValidator {
    
    func isFirstNameValid(firstName: String) -> Bool{
        let firstNameIsValid: Bool = ((firstName.count > SignupConstants.minimumLengthName) && (firstName.count < SignupConstants.maximumLengthName))  ? true : false
        
        return firstNameIsValid
    }
}
