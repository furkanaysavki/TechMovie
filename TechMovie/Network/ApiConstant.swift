//
//  ApiConstant.swift
//  TechMovie
//
//  Created by Furkan Ayşavkı on 18.12.2022.
//

import Foundation

struct Constants {
    static let API_KEY = "0700a3034f45f8f85760a46ba4c4f265"
    static let baseURL = "https://api.themoviedb.org"
    static let YoutubeAPI_KEY = "AIzaSyCcGTBneKy4-ZZRiPS0MoKwAKBbR27mqJs"
    static let YoutubeBaseURL = "https://youtube.googleapis.com/youtube/v3/search?"
    static let TrendMovie = "\(Constants.baseURL)/3/trending/movie/day?api_key=\(Constants.API_KEY)"
    static let PopularMovie = "\(Constants.baseURL)/3/movie/popular?api_key=\(Constants.API_KEY)&language=en-US&page=1"
    static let Upcoming = "\(Constants.baseURL)/3/movie/upcoming?api_key=\(Constants.API_KEY)&language=en-US&page=1"
    static let TopRated = "\(Constants.baseURL)/3/movie/top_rated?api_key=\(Constants.API_KEY)&language=en-US&page=1"
    static let Discover = "\(Constants.baseURL)/3/discover/movie?api_key=\(Constants.API_KEY)&language=en-US&sort_by=popularity.desc&include_adult=false&include_video=false&page=1&with_watch_monetization_types=flatrate"
}
