//
//  MovieListModel.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation

struct MovieModel: Codable {
    
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    
    enum MovieCodingKey: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKey.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.posterPath = try container.decode(String.self, forKey: .posterPath)
        self.overview = try container.decode(String.self, forKey: .overview)
    }
}

struct MovieListModel: Codable {
    
    let page: Int
    let movieList: [MovieModel]
    
    enum MovieCodingKey: String, CodingKey {
        case page, results
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieCodingKey.self)
        self.page = try container.decode(Int.self, forKey: .page)
        self.movieList = try container.decode([MovieModel].self, forKey: .results)
    }
}
