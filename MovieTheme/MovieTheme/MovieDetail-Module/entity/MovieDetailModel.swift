//
//  MovieDetailModel.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 09/07/23.
//

import Foundation

struct MovieDetailModel: Codable {
    
    let id: Int
    let title: String
    let posterPath: String
    let overview: String
    let voteAverage: Float
    
    enum MovieDetailCodingKey: String, CodingKey {
        case id, title, overview
        case posterPath = "poster_path"
        case voteAverage = "vote_average"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: MovieDetailCodingKey.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.title = try container.decode(String.self, forKey: .title)
        self.posterPath = try container.decode(String.self, forKey: .posterPath)
        self.overview = try container.decode(String.self, forKey: .overview)
        self.voteAverage = try container.decode(Float.self, forKey: .voteAverage)
    }
}
