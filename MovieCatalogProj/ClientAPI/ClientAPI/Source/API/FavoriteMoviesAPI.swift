//
//  FavoriteMoviesAPI.swift
//  ClientAPI
//
//  Created by Tark Wight on 14.10.2024.
//

internal import Alamofire

open class FavoriteMoviesAPI {
    
    open class func getFavorites(completion: @escaping (_ data: MoviesListModel?, _ error: Error?) -> Void) {
        guard let token = KeychainManager.shared.getToken() else {
            print("No token found")
            completion(nil, NSError(domain: "", code: 401, userInfo: [NSLocalizedDescriptionKey: "No token found"]))
            return
        }
        
        let headers: HTTPHeaders = [
            "Authorization": "Bearer \(token)"
        ]
        
        AF.request(ApiUrls.FavoriteMovies.favorites, headers: headers)
            .validate()
            .responseDecodable(of: MoviesListModel.self) { response in
                switch response.result {
                case .success(let data):
                    completion(data, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
    
   
}
