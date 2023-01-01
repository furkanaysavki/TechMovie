//
//  HomeViewModel.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation
import RxSwift
import RxCocoa
import Accelerate

class HomeViewModel: HomeViewModelProtocol {
    
    var DiscoverMovies = PublishSubject<[Title]>()
    var trendMovies = PublishSubject<[Title]>()
    var popularMovies = PublishSubject<[Title]>()
    var upComingMovies = PublishSubject<[Title]>()
    var topRatedMovies = PublishSubject<[Title]>()
    
    lazy var network: GetMovie = Service()
    
    func getDiscover() {
        network.getData(MovieResponse.self, url: Constants.Discover) { [weak self] result in
            switch result {
            case .success(let response):
                self?.DiscoverMovies.onNext(response.results)
            case .failure(_):
                print(NetworkError.parsingFailed)
                
            }
        }
    }
        func getTrendingMovies() {
            network.getData(MovieResponse.self, url: Constants.TrendMovie) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.trendMovies.onNext(response.results)
                case .failure(_):
                    print(NetworkError.parsingFailed)
                    
                }
            }
            
        }
        
        func getPopularMovies() {
            network.getData(MovieResponse.self, url: Constants.PopularMovie) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.popularMovies.onNext(response.results)
                case .failure(_):
                    print(NetworkError.parsingFailed)
                    
                }
            }
            
        }
        func getUpcomingMovies() {
            network.getData(MovieResponse.self, url: Constants.Upcoming) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.upComingMovies.onNext(response.results)
                case .failure(_):
                    print(NetworkError.parsingFailed)
                    
                }
            }
            
        }
        func getTopRatedMovies() {
            network.getData(MovieResponse.self, url: Constants.TopRated) { [weak self] result in
                switch result {
                case .success(let response):
                    self?.topRatedMovies.onNext(response.results)
                case .failure(_):
                    print(NetworkError.parsingFailed)
                    
                }
            }
            
        }
    
    }
    

