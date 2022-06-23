//
//  SignupFormModelValidator.swift
//  tddApp
//
//  Created by cit on 22/06/22.
//

import Foundation

class SignupFormModelValidator {
     
    func isFirstNameValid(firstName: String) -> Bool{
        let firstNameIsValid: Bool = firstName.isStringLenghtValid(text: firstName, minLengthLimit: FirstNameConstants.minimumLengthName , maxLengthLimit: FirstNameConstants.maximumLengthName)
        return firstNameIsValid
    }
    
    func isPasswordMatchValid(firstPassword:String,secondPassword:String) -> Bool{
        let matchPassword: Bool = firstPassword == secondPassword ? true : false
        return matchPassword
    }
    
    func isPasswordLenghtValid(password:String) -> Bool {
        let passwordIsValid: Bool = password.isStringLenghtValid(text: password, minLengthLimit: PasswordConstants.minimumLengthPassword, maxLengthLimit: PasswordConstants.maximumLengthPassword)
        return passwordIsValid
    }
}
