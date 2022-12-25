//
//  HomeViewModelProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation

protocol HomeViewModelProtocol {
    
    var network: GetMovieAndTv {get set}
    func getDiscover()
    func getTrendingMovies()
    func getTrendingTvs()
    func getPopularMovies()
    func getUpcomingMovies()
    func getTopRatedMovies()
}
