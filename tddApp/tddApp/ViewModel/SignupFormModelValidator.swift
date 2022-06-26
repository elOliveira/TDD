//
//  SignupFormModelValidator.swift
//  tddApp
//
//  Created by cit on 22/06/22.
//

import Foundation

class SignupFormModelValidator {
     
    func isFirstNameValid(firstName: String) -> Bool{
        let firstNameIsValid: Bool = firstName.isStringLenghtValid(text: firstName, minLengthLimit: SignupConstants.firstNameMinimumLength , maxLengthLimit: SignupConstants.firstNameMaximumLength)
        return firstNameIsValid
    }
    
    func isPasswordMatchValid(firstPassword:String,secondPassword:String) -> Bool{
        let matchPassword: Bool = firstPassword == secondPassword ? true : false
        return matchPassword
    }
    
    func isPasswordLenghtValid(password:String) -> Bool {
        let passwordIsValid: Bool = password.isStringLenghtValid(text: password, minLengthLimit: SignupConstants.passwordMinimumLength, maxLengthLimit: SignupConstants.passwordMaximumLength)
        return passwordIsValid
    }
    
    func isValidEmailFormat(email:String) -> Bool{
        return NSPredicate(format: "Self Matches %@","[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}").evaluate(with: email)
    }
}
