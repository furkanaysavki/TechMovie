//
//  ServiceProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation

protocol GetMovieAndTv {
    func getData<T: Decodable>(_ type: T.Type, url: String, completion: @escaping(Result<T,NetworkError>) -> Void)
}
