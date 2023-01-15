//
//  FavouriteViewModel.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 2.01.2023.
//

import Foundation
import RxSwift
import RxCocoa

final class FavouriteViewModel: FavouriteViewModelProtocol {
    
    var realmManager: RealmProtocol = RealmHelper()
    var favouriteMovie = BehaviorSubject(value: [FavouriteMovie]())
    
    
    func saveMovie(id: Int, original_title: String, poster_path: String ) {
        
        realmManager.addMovieToFavorites(movie:FavouriteMovie(id: id, original_title: original_title, poster_path: poster_path) )
    }
    func getFavouriteMovie() {
        
        let movie = realmManager.fetchFavoriteList()
        
        favouriteMovie.bind { save in
            save.onNext(movie)
        }
        }
}



 
