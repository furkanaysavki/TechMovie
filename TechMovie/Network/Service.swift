//
//  Service.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation
import Alamofire

final class Service: GetMovieAndTv, GetMovieDetailAndYoutube  {
    
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
    func getMovieFromYoutube( url: String, query: String, completion: @escaping(Result<VideoElement,NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)") else {return}
        AF.request(url, method: .get).responseDecodable(of:YoutubeSearchResponse.self) { response in
            
            switch response.result {
            case .success(let result):
                completion(.success(result.items[0]))
            case .failure(_):
                completion(.failure(NetworkError.parsingFailed))
            }
            
        }
    }
    func getMovieDetail<T: Codable>(_ type: T.Type, url: String, id: Int, completion: @escaping(Result<T,NetworkError>) -> Void) {
        
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(id)?api_key=\(Constants.API_KEY)&language=language=en-US") else {
            return }
        AF.request(url, method: .get).responseDecodable(of:T.self) { response in
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(_):
                completion(.failure(NetworkError.parsingFailed))
            }
            
        }
    }
    func getCastData<T: Codable>(_ type: T.Type, url: String, id: Int, completion: @escaping(Result<T,NetworkError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(id)/credits?api_key=\(Constants.API_KEY)&language=en-US") else {
            return }
        AF.request(url, method: .get).responseDecodable(of:T.self) { response in
            
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(_):
                completion(.failure(NetworkError.parsingFailed))
            }
        }
    }
    func getRecommendations<T: Codable>(_ type: T.Type, url: String, id: Int, completion: @escaping(Result<T,NetworkError>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/movie/\(id)/recommendations?api_key=\(Constants.API_KEY)&language=en-US&page=1") else {
            return }
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
