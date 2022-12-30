//
//  CastModel.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 28.12.2022.
//

import Foundation

struct CastModel: Codable {
    let cast: [CastResults]
}

struct CastResults: Codable {
    let name: String?
    let profilePath: String?
    let character: String?
    let id: Int

    enum CodingKeys: String, CodingKey {
        case name
        case profilePath = "profile_path"
        case character
        case id
    }
}
