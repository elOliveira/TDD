//
//  SignupFormModelValidatorTests.swift
//  tddAppTests
//
//  Created by cit on 22/06/22.
//

import XCTest
@testable import tddApp

class SignupFormModelValidatorTests: XCTestCase {

    var sut: SignupFormModelValidator!

    override func setUp(){
        sut = SignupFormModelValidator()
    }
    
    override func tearDown() {
        sut = nil
    }
    
    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() throws {
        //MARK: - Arrange

        //MARK: - Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"ELO")
        
        //MARK: - Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        //MARK: - Arrange
        
        //MARK: - Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"E")
        //MARK: - Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned False for a first name that is shorter than \(SignupConstants.minimumLengthName) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        //MARK: - Arrange
        
        //MARK: - Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"ELOELOELOELOELOELOELOELOELOELOELOELOELOELO")

        //MARK: - Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned False for a first name that is longer than \(SignupConstants.maximumLengthName) characters but it has returned TRUE")
    }
}
