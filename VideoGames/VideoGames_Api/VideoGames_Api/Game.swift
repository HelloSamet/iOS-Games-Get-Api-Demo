//
//  Game.swift
//  VideoGames_Api
//
//  Created by Abdulsamet Göçmen on 4.05.2022.
//

import Foundation

struct Game: Codable {
    let id: Int?
    let slug: String?
    let name: String?
    let added: Int?

    enum CodingKeys: String, CodingKey {
        case id
        case slug
        case name
        case added
    }
}
