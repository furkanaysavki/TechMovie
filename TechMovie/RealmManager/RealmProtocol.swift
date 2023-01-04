//
//  RealmProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 2.01.2023.
//

import Foundation
import RealmSwift

protocol RealmProtocol {
    
    func addMovieToFavorites(movie: FavouriteMovie)
    func fetchFavoriteList() -> [FavouriteMovie]
    func deleteAllFromDatabase()
    func deleteFromDb(movie : FavouriteMovie )
}
