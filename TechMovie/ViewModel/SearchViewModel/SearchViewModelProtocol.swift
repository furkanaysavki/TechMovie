//
//  SearchViewModelProtocol.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 31.12.2022.
//

import Foundation

protocol SearchViewModelProtocol {
    
    var network: SearchMovie {get set}
    func getDiscover()
    func searchMovie(with query: String )
}
