//
//  SignupWerbServiceTests.swift
//  tddAppTests
//
//  Created by cit on 23/06/22.
//

import XCTest
@testable import tddApp

class SignupWebServiceTests: XCTestCase {


    override func setUp(){
    }
    
    override func tearDown(){
    }

    func testSignUpWebService_WhenGivenSucessFullResponse_ReturnsSucess(){
        // Arrange
        let sut = SignupWebService(urlString: "http://appsdeveloperblog.com:8080/signup-mock-service/users")
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")
        let signFormRequestModel = SignupFormRequestModel(firstName: "ELO", lastName: "Oliveira", email: "teste@gmail.com", password: "123456")
        // Act
        sut.singup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            // Asserts
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 4)
    }
}

// Arrange
// Act
// Asserts
