//
//  SignupWerbServiceTests.swift
//  tddAppTests
//
//  Created by cit on 23/06/22.
//

import XCTest
@testable import tddApp

class SignupWebServiceTests: XCTestCase {

    var sut: SignupWebService!

    override func setUp(){
        sut = SignupWebService()
    }
    
    override func tearDown(){
    }

    func testSignUpWebService_WhenGivenSucessFullResponse_ReturnsSucess(){
        // Arrange
        let signFormRequestModel = SignupFormRequestModel(firstName: "ELO", lastName: "Oliveira", email: "teste@gmail.com", password: "123456")
        // Act
        sut.singup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            

        }
        // Asserts
    }
}

// Arrange
// Act
// Asserts
