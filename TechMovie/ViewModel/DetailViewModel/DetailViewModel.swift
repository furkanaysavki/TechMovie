//
//  DetailViewModel.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 25.12.2022.
//

import Foundation
import RxCocoa
import RxSwift

final class DetailViewModel: DetailViewModelProtocol {
    
    lazy var network: GetMovieDetailAndYoutube = Service()
    var detailMovie = PublishSubject<MovieDetailsModel>()
    var youtubeTrailer = PublishSubject<VideoElement>()
    var castData = PublishSubject<[CastResults]>()
    var recommendation = PublishSubject<[Title]>()
    
    
    func getDetails(id: Int) {
        
        let url = "\(Constants.baseURL)/3/movie/\(id)?api_key=\(Constants.API_KEY)&language=language=en-US"
        network.getMovieDetail(MovieDetailsModel.self, url: url, id: id) { [weak self] result in
            switch result {
            case .success(let detail):
                self?.detailMovie.onNext(detail)
                print(detail)
                case .failure(_):
                print(NetworkError.parsingFailed)
            }
        }
        
    }
    func getMovieYoutube( query: String ) {
        
        let url = "\(Constants.YoutubeBaseURL)q=\(query)&key=\(Constants.YoutubeAPI_KEY)"
        network.getMovieFromYoutube( url: url, query: query) { [weak self] result in
            switch result {
            case .success(let response):
                self?.youtubeTrailer.onNext(response)
                print("youtubeResponse:\(response)")
            case .failure(_):
                print(NetworkError.parsingFailed)
                print("YOUTUBE OLMADIIII..")
            }
        }
        
    }
    func getCastData(id: Int) {
        
        let url = "\(Constants.baseURL)/3/movie/\(id)/credits?api_key=\(Constants.API_KEY)&language=en-US"
        network.getCastData(CastModel.self, url: url, id: id) { [weak self] result in
            switch result {
            case .success(let response):
                self?.castData.onNext(response.cast)
             
            case .failure(_):
                print(NetworkError.parsingFailed)
            }
        }
    }
    func getRecommendations(id: Int) {
        
        let url = "\(Constants.baseURL)/3/movie/\(id)/recommendations?api_key=\(Constants.API_KEY)&language=en-US&page=1"
        network.getRecommendations(MovieResponse.self, url: url, id: id) { [weak self] result in
            switch result {
            case .success(let response):
                self?.recommendation.onNext(response.results)
             
            case .failure(_):
                print(NetworkError.parsingFailed)
            }
        }
    }
}
