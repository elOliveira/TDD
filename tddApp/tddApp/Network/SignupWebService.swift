//
//  SignupWerbService.swift
//  tddApp
//
//  Created by cit on 23/06/22.
//

import Foundation

class SignupWebService{
    private var urlSession: URLSession
    private var urlString: String
    
    init(urlString:String, urlSession: URLSession = .shared){
        self.urlSession = urlSession
        self.urlString  = urlString
    }
    
    func signup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupErro?) -> Void ){
        guard let url = URL(string: urlString) else {
            completionHandler(nil,SignupErro.invalidRequestURLString)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        //remider create a unit test here for error value here

        let dataTask = urlSession.dataTask(with: request) { (data,response,error) in
            //remider create a unit test here for error value here
            if let requestError = error {
                completionHandler(nil, SignupErro.failedRequest(description: requestError.localizedDescription))
                return
            }
            
            if let data = data,
               let signupResponseModel = try? JSONDecoder().decode(SignupResponseModel.self, from: data) {
                completionHandler(signupResponseModel,nil)
            }else{
            //remider create a unit test here for error value here
                completionHandler(nil, SignupErro.invalidResponseModel)
            }
        }
        dataTask.resume()
    }
}
