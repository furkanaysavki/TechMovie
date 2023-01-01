//
//  SearchViewModel.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 31.12.2022.
//

import Foundation
import RxCocoa
import RxSwift


class SearchViewModel: SearchViewModelProtocol {
    
    var DiscoverMovies = PublishSubject<[Title]>()
    var Search = PublishSubject<[Title]>()
    lazy var network: SearchMovie = Service()
    
    
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
    func searchMovie(with query: String ) {
        
        let url = "\(Constants.baseURL)/3/search/movie?api_key=\(Constants.API_KEY)&query=\(query)"
        network.searchMovie(MovieResponse.self, url: url, query: query) { [weak self] result in
            switch result {
            case .success(let response):
                self?.Search.onNext(response.results)
                print(response.results)
            case .failure(_):
                print(NetworkError.parsingFailed)
            }
            
        }
    }
}
