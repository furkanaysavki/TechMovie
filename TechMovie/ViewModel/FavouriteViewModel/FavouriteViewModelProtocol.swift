//
//  FavouriteViewModelProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 2.01.2023.
//

import Foundation


protocol FavouriteViewModelProtocol {
    
    var realmManager: RealmProtocol {get set}
    func saveMovie(id: Int, original_title: String, poster_path: String )
    func getFavouriteMovie()
}
