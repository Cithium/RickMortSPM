//
//  CharacterInfoView.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-19.
//

import SwiftUI

public struct CharacterInfoView: View {
    var name: String
    var status: String
    var origin: String
    var species: String
    
    public var body: some View {
        Group {
            HStack {
                Text("Name: ")
                    .foregroundColor(.white)
                Spacer()
                Text(name)
                    .foregroundColor(.neonGreen)
            }
            
            HStack {
                Text("Status: ")
                    .foregroundColor(.white)
                Spacer()
                Text(status)
                    .foregroundColor(.neonGreen)
            }
            
            HStack {
                Text("Origin: ")
                    .foregroundColor(.white)
                Spacer()
                Text(origin)
                    .foregroundColor(.neonGreen)
            }
            
            HStack {
                Text("Species: ")
                    .foregroundColor(.white)
                Spacer()
                Text(species)
                    .foregroundColor(.neonGreen)
            }
        }
        .font(.LCD.fixed(.solid, size: 12.5))
    }
}

struct CharacterInfoView_Previews: PreviewProvider {
    static var previews: some View {
        CharacterInfoView(name: "Rick", status: "Alive", origin: "Earth", species: "Human")
    }
}
