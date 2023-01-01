//
//  DetailViewModelProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 25.12.2022.
//

import Foundation

protocol DetailViewModelProtocol {
    
    var network: GetMovieDetailAndYoutube {get set}
    func getDetails(id: Int)
    func getMovieYoutube(query: String)
    func getCastData(id: Int)
    func getRecommendations(id: Int)
}
