//
//  MovieThemeService.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation
import Alamofire

enum MovieServicePath {
    case getGenre
    case getMovieList(String)
    case getMovieDetail(Int)
}

public struct MovieThemeService {
    
    private static let baseURL = "https://api.themoviedb.org/3/"
    public static let header: HTTPHeaders = ["Authorization": "Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMzhlYThjN2Y5OWZjYmI2MWEwOGFiOWE5NDNlNGJhNiIsInN1YiI6IjY0YTkyZjliNjZhMGQzMDEwMGQ4OTVmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hExpVQR8nD6tm827e-wsIYVnGoMwKH9f1djmDo8Xi5Q", "accept": "application/json"]
    
    static func getURL(param: MovieServicePath) -> URLConvertible {
        switch param {
        case .getGenre:
            return URL(string: baseURL + "genre/movie/list")!
        case .getMovieList(let genre):
            return URL(string: baseURL + "discover/movie?with_genres=" + genre)!
        case .getMovieDetail(let movieId):
            return URL(string: baseURL + "movie/\(movieId)")!
        }
    }
}

//curl --request GET \
//     --url 'https://api.themoviedb.org/3/genre/movie/list?language=en' \
//     --header 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIwMzhlYThjN2Y5OWZjYmI2MWEwOGFiOWE5NDNlNGJhNiIsInN1YiI6IjY0YTkyZjliNjZhMGQzMDEwMGQ4OTVmNSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.hExpVQR8nD6tm827e-wsIYVnGoMwKH9f1djmDo8Xi5Q' \
//     --header 'accept: application/json'
