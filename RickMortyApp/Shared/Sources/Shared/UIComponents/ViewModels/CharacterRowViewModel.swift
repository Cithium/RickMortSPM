//
//  CharacterCardViewModel.swift
//  RickAndMorty
//
//  Created by Hamza on 2023-06-19.
//

import Foundation

extension CharacterRowView {
    public class ViewModel: Identifiable {
        public let id: Int64
        let name: String
        let status: String
        let imageURL: URL?
        
        public init(character: Character) {
            self.id = character.id
            self.name = character.name
            self.status = character.status
            self.imageURL = URL(string: character.image)
        }
    }
}
