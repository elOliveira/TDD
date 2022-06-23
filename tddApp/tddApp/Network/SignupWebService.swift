//
//  SignupWerbService.swift
//  tddApp
//
//  Created by cit on 23/06/22.
//

import Foundation

class SignupWebService{
    
    private var urlString: String
    
    init(urlString:String){
        self.urlString = urlString
    }
    
    func singup(withForm formModel: SignupFormRequestModel, completionHandler: @escaping(SignupResponseModel?, SignupErros?) -> Void ){
        
        guard let url = URL(string: urlString) else { return } // remider create a unit test here for nul value
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("aplication/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = try? JSONEncoder().encode(formModel)
        
        let dataTask = URLSession.shared.dataTask(with: request){(data,response,error) in
            
        }
        
        dataTask.resume()
    }
}
