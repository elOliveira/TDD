//
//  SignupWerbServiceTests.swift
//  tddAppTests
//
//  Created by cit on 23/06/22.
//

import XCTest
@testable import tddApp

class SignupWebServiceTests: XCTestCase {
    var sut:SignupWebService!
    var signFormRequestModel:SignupFormRequestModel!
    
    override func setUp(){
        let config = URLSessionConfiguration.ephemeral
        config.protocolClasses = [MockURLProtocol.self]
        let urlSession = URLSession(configuration: config)
        sut = SignupWebService(urlString: SignupConstants.signupURLString ,urlSession: urlSession)
        signFormRequestModel = SignupFormRequestModel(firstName: "ELO", lastName: "Oliveira", email: "teste@gmail.com", password: "123456")
    
    }
    
    override func tearDown(){
        sut = nil
        signFormRequestModel = nil
    }
    
    func testSignUpWebService_WhenGivenSucessFullResponse_ReturnsSucess(){
        // Arrange
        let jsonString = "{\"status\":\"ok\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup Web Service Response Expectation")

        // Act
        sut.singup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            // Asserts
            XCTAssertEqual(signupResponseModel?.status, "ok")
            expectation.fulfill()
        }
        self.wait(for: [expectation] ,timeout: 5)
    }
    
    func testSignUpWebService_WhenReceivedDifferentJSONResponse_ErrorTookPlace(){
        // Arrange
        let jsonString = "{\"path\":\"/users\", \"error\":\"Internal Server Error\"}"
        MockURLProtocol.stubResponseData = jsonString.data(using: .utf8)
        let expectation = self.expectation(description: "Signup() method expectation for a response that contains a different JSON structure")
        
        // Act
        sut.singup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            // Asserts
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknow JSON response, should have been nil")
            XCTAssertEqual(error, SignupErros.resonseModelParsingError, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation] ,timeout: 5)
    }
}
