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
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        
        //
        let sut = SignupWebService(urlString: SignupConstants.signupURLString ,urlSession: urlSession)
        let signFormRequestModel = SignupFormRequestModel(firstName: "ELO", lastName: "Oliveira", email: "teste@gmail.com", password: "123456")
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")

        // Act
        sut.singup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            // Asserts
            // "{\"status\":\"ok\"}"
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }

        self.wait(for: [expectation] ,timeout: 5)
    }
}

// Arrange
// Act
// Asserts
