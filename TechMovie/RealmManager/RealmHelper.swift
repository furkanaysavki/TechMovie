//
//  Realm.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 2.01.2023.
//

import Foundation
import Realm
import RealmSwift

class RealmHelper: RealmProtocol {
    
        var database:Realm
        static let sharedInstance = RealmHelper()
    
     init() {
        database = try! Realm()
    }
    
    func addMovieToFavorites(movie: FavouriteMovie) {
        try! database.write {
            database.add(movie)
            
        }
    }
    
    func fetchFavoriteList() -> [FavouriteMovie] {
        let object = database.objects(FavouriteMovie.self)
        return Array(object);
    }
    
    func deleteAllFromDatabase()  {
        try!   database.write {
            database.deleteAll()
        }
    }
    
    func deleteFromDb(movie : FavouriteMovie )   {
        try! database.write {
            database.delete(movie)
        }
    }
}

