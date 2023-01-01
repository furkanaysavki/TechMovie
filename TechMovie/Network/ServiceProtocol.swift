//
//  ServiceProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation

protocol GetMovie {
    
    func getData<T: Decodable>(_ type: T.Type, url: String, completion: @escaping(Result<T,NetworkError>) -> Void)
}
protocol GetMovieDetailAndYoutube {
    
    func getMovieFromYoutube( url: String, query: String, completion: @escaping(Result<VideoElement,NetworkError>) -> Void)
    
    func getMovieDetail<T: Codable>(_ type: T.Type, url: String, id: Int, completion: @escaping(Result<T,NetworkError>) -> Void)
    
    func getCastData<T: Codable>(_ type: T.Type, url: String, id: Int, completion: @escaping(Result<T,NetworkError>) -> Void)
    
    func getRecommendations<T: Codable>(_ type: T.Type, url: String, id: Int, completion: @escaping(Result<T,NetworkError>) -> Void)
}
protocol SearchMovie {
    
    func searchMovie<T: Decodable>(_ type: T.Type, url: String, query: String, completion: @escaping(Result<T,NetworkError>) -> Void)
    
    func getData<T: Decodable>(_ type: T.Type, url: String, completion: @escaping(Result<T,NetworkError>) -> Void)
}
