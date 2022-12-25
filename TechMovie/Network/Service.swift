//
//  Service.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation
import Alamofire

final class Service: GetMovieAndTv  {
 
    func getData<T: Decodable>(_ type: T.Type, url: String, completion: @escaping(Result<T,NetworkError>) -> Void) {
        
        AF.request(url, method: .get).responseDecodable(of:T.self) { response in
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(_):
                completion(.failure(NetworkError.parsingFailed))
            }
            
        }
    }
    
    
       
}

