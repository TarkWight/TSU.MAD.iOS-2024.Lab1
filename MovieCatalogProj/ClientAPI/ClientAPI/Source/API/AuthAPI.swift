//
//  AuthAPI.swift
//  ClientAPI
//
//  Created by Tark Wight on 14.10.2024.
//

internal import Alamofire

open class AuthAPI {
    
    // MARK: - Register
    
    /**
     Registers a new user with the provided details.
     
     - Parameters:
     - body: The registration details.
     - completion: The closure to call with the result.
     */
    open class func register(
        body: UserRegisterModel,
        completion: @escaping (_ success: Bool, _ error: Error?) -> Void
    ) {
        let url = ApiUrls.Auth.register
        
        AF.request(
            url,
            method: .post,
            parameters: body,
            encoder: JSONParameterEncoder.default
        )
        .validate()
        .response { response in
            switch response.result {
                case .success:
                    completion(true, nil)
                case .failure(let error):
                    completion(false, error)
            }
        }
    }
    
}
