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
        sut.signup(withForm: signFormRequestModel){ (signupResponseModel, error) in
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
        sut.signup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            // Asserts
            XCTAssertNil(signupResponseModel, "The response model for a request containing unknow JSON response, should have been nil")
            XCTAssertEqual(error, SignupErro.invalidResponseModel, "The signup() method did not return expected error")
            expectation.fulfill()
        }
        self.wait(for: [expectation] ,timeout: 5)
    }
    
    func testSignUpWebService_WhenEmptyURLStringProvided_ReturnsError(){
        // Arrange
        let expectation = self.expectation(description: "An empty request URL string expectation")
        sut = SignupWebService(urlString: "")
        // Act
        sut.signup(withForm: signFormRequestModel){ (signupResponseModel, error) in
            // Asserts
            XCTAssertEqual(error, SignupErro.invalidRequestURLString, "The signup() method did not return an expected error for an invaliudRequestURLString error")
            XCTAssertNil(signupResponseModel,"When an invalidRequestURLString takes place, the response model must be nil")
            expectation.fulfill()
        }
        self.wait(for: [expectation], timeout: 2)
    }
    
    func testSignupWebService_WhenURLRequestFails_ReturnsErrorMessageDescription(){
        // Arrange
        let expectation = self.expectation(description: "A failed Request expectation")
        let errorDescription = "A localized description of an error"
        MockURLProtocol.error = NSError(domain: "", code: 0, userInfo: [NSLocalizedDescriptionKey: errorDescription])
        //SignupErro.failedRequest(description: errorDescription)
        
        // Act
        sut.signup(withForm: signFormRequestModel) { (signupResponseModel, error) in
            // Assert
            XCTAssertEqual(error, SignupErro.failedRequest(description: errorDescription), "The signup() method did not return an expecter error for the Failed Request")
            expectation.fulfill()
        }
        
        self.wait(for: [expectation], timeout: 2)
    }
}
