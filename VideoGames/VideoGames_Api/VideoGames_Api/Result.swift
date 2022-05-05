//
//  Result.swift
//  VideoGames_Api
//
//  Created by Abdulsamet Göçmen on 4.05.2022.
//

import Foundation
import UIKit

struct Result: Codable {
    let id: Int?
    let name: String?
    let slug: String?
    let gamesCount: Int?
    let imageBackground: String?
    let image: String?
    let yearStart: Int?
    let yearEnd: JSONNull?
    let games: [Game]?

    enum CodingKeys: String, CodingKey {
        case id
        case name
        case slug
        case gamesCount
        case imageBackground
        case image
        case yearStart
        case yearEnd
        case games
    }
}
