//
//  SignupFormModelValidatorTests.swift
//  tddAppTests
//
//  Created by cit on 22/06/22.
//

import XCTest
@testable import tddApp

class SignupFormModelValidatorTests: XCTestCase {

    override func setUpWithError() throws {}
    override func tearDownWithError() throws {}

    func testSignFormModelValidator_WhenValidFirstNameProvided_ShouldReturnTrue() throws {
        //MARK: - Arrange
        let sut = SignupFormModelValidator()
        //MARK: - Act
        let isFirstNameValid = sut.isFirstNameValid(firstName:"ELO")
        
        //MARK: - Assert
        XCTAssertTrue(isFirstNameValid,"The isFirstNameValid() should have returned TRUE for a valid first name but returned FALSE")
        
    }
}
