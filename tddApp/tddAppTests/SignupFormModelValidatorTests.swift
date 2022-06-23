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
    
    //MARK: - First Name Tests

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue(){
        //Arrange

        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"ELO")
        
        //Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
        
    }
    
    func testSignupFormModelValidator_WhenTooShortFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"E")
        //Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned False for a first name that is shorter than \(FirstNameConstants.minimumLengthName) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongFirstNameProvided_ShouldReturnFalse(){
        //Arrange
        
        //Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"ELOELOELOELOELOELOELOELOELOELOELOELOELOELO")

        //Assert
        XCTAssertFalse(isFirstNameValid,"The isFirstNameValid() should have returned False for a first name that is longer than \(FirstNameConstants.maximumLengthName) characters but it has returned TRUE")
    }
    //MARK: - Password Tests

    func testSignupFormModelValidator_WhenPasswordIsPerfectSize_ShouldReturnTrue(){
        //Arrange

        //Act
        let isPasswordValid = sut.isPasswordLenghtValid(password:"1234567")
        //Assert
        XCTAssertTrue(isPasswordValid,"The isPasswordLenghtValid() should have returned True for a password that is lengh between \(PasswordConstants.minimumLengthPassword) and \(PasswordConstants.maximumLengthPassword) characters but it has returned False")
    }
    
    func testSignupFormModelValidator_WhenIsMatchBetweenTwoPasswordsProvided_ShouldReturnTrue(){
        //Arrange
        
        //Act
        let matchPassword = sut.isPasswordMatchValid(firstPassword:"Password1",secondPassword:"Password1")
        //Assertee
        
         XCTAssertTrue(matchPassword, "The isPasswordMatchValid() should have returned TRUE for matching passwords but it has returned FALSE")
    }
    
    func testSignupFormModelValidator_WhenTooShortPasswordProvided_ShouldReturnFalse(){
        //Arrange

        //Act
        let passwordValid = sut.isPasswordLenghtValid(password:"P")
        //Assert
        XCTAssertFalse(passwordValid,"The isPasswordLenghtValid() should have returned False for a password that is shorter than \(PasswordConstants.minimumLengthPassword) characters but it has returned TRUE")
    }
    
    func testSignupFormModelValidator_WhenTooLongPasswordProvided_ShouldReturnFalse(){
        //Arrange

        //Act
        let isPasswordValid = sut.isPasswordLenghtValid(password:"swordaswordaswordaswordaswordaswordaswordasworda")
        //Assert
        XCTAssertFalse(isPasswordValid,"The isPaswordIsValid() should have returned False for a password that is Longer than \(PasswordConstants.maximumLengthPassword) characters but it has returned TRUE")
    }
    
    //MARK: - Email Tests
    
    func testSignupFormModelValidator_WhenEmailIsValid_ShouldReturnTrue(){
        //Arrange

        //Act
        let isEmailValid = sut.isValidEmailFormat(email:"jubileu@hotmail.com")
        //Assert
        XCTAssertTrue(isEmailValid,"The isValidEmailFormat() should have returned True for a email valid but is has returned FALSE")
    }
    
}
