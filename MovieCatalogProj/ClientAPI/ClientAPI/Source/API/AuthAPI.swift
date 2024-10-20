//
//  AuthAPI.swift
//  ClientAPI
//
//  Created by Tark Wight on 14.10.2024.
//

internal import Alamofire

open class AuthAPI {
    
    // MARK: - Login
    
    /**
     Logs in a user with the provided credentials.
     
     - Parameters:
     - body: The login credentials.
     - completion: The closure to call with the result.
     */
    open class func login(
        body: LoginCredentials,
        completion: @escaping (_ success: Bool, _ error: Error?) -> Void
    ) {
        let url = ApiUrls.Auth.login
        
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
    
    // MARK: - Logout
    
    /**
     Logs out the current user.
     
     - Parameters:
     - completion: The closure to call with the result.
     */
    open class func logout(
        completion: @escaping (_ success: Bool, _ error: Error?) -> Void
    ) {
        let url = ApiUrls.Auth.logout
        
        AF.request(
            url,
            method: .post
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
