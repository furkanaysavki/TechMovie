//
//  NetworkError.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation

enum NetworkError: Error {
    
    case networkFailed
    case parsingFailed
    
    var errorDescription: String? {
        
        switch self {
        case .networkFailed:
            return "Network Failed"
        case .parsingFailed:
            return "Parsing Failed "
       
        }
    }
    
}

