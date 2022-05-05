//
//  FakeData.swift
//  VideoGames_Api
//
//  Created by Abdulsamet Göçmen on 4.05.2022.
//

import Foundation

// MARK: - FakeData
struct FakeData: Codable {
    let count: Int?
    let next: String?
    let previous: JSONNull?
    let results: [Result]?

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}
