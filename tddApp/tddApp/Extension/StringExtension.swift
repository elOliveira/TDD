//
//  SignupExtension.swift
//  tddApp
//
//  Created by cit on 22/06/22.
//

import Foundation

extension String {
    func isStringLenghtValid(text:String, minLengthLimit:Int, maxLengthLimit:Int) -> Bool{
        let isValid =  (text.count < minLengthLimit || text.count > maxLengthLimit)  ? false : true
        return isValid
    }
}
