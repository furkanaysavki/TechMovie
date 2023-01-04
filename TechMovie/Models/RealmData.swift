//
//  RealmData.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 2.01.2023.
//

import Foundation
import RealmSwift

class FavouriteMovie : Object {
    
    @objc dynamic var id : Int = 0
    @objc dynamic var original_title : String = ""
    @objc dynamic var poster_path : String = ""

convenience init(id: Int, original_title : String, poster_path : String) {
    self.init()
    
    self.id = id
    self.original_title = original_title
    self.poster_path = poster_path
}
}
