//
//  CharacterDetailsViewModel.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-19.
//

import Foundation

public extension CharacterDetailsView {
    class ViewModel {
        let name: String
        let status: String
        let origin: String
        let species: String
        let imageURL: URL?
        
        public init(character: Character) {
            self.name = character.name
            self.status = character.status
            self.origin = character.origin.name
            self.species = character.species
            self.imageURL = URL(string: character.image)
        }
    }
}
