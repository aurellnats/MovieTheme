//
//  GenreModel.swift
//  MovieTheme
//
//  Created by Aurelia Natasha on 08/07/23.
//

import Foundation

struct GenreModel: Codable {
    
    let id: Int
    let name: String
    
    enum ModelCodingKey: String, CodingKey {
        case id, name
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ModelCodingKey.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
    }
}

struct GenreListModel: Codable {
    
    let genres: [GenreModel]
    
    enum ModelCodingKey: String, CodingKey {
        case genres
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: ModelCodingKey.self)
        self.genres = try container.decode([GenreModel].self, forKey: .genres)
    }
}
