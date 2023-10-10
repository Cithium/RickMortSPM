//
//  Models.swift
//  
//
//  Created by Hamza on 2023-07-08.
//

import Foundation

public struct CharacterResult: Decodable {
    public let info: Info
    public let characters: [Character]
    
    private enum CodingKeys: String, CodingKey {
        case info = "info"
        case characters = "results"
    }
}

public struct Info: Decodable {
    public let count: Int
    public let pages: Int
    public let next: String?
    public let prev: String?
}

public struct Character: Decodable, Identifiable {
    public let id: Int64
    public let name: String
    public let status: String
    public let species: String
    public let episode: [String]
    public let location: Location
    public let origin: Origin
    public let image: String
}

extension Character: Equatable {
    public static func == (lhs: Character, rhs: Character) -> Bool {
        lhs.id == rhs.id
    }
}

public struct Location: Decodable {
    public let name: String
    public let type: String?
    public let dimension: String?
    public let residents: [String]?
    public let url: String
}

public struct Origin: Decodable {
    public let name: String
    public let url: String
}
