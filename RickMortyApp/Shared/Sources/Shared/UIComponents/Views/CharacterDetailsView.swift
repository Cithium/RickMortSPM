//
//  CharacterDetailsView.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-19.
//

import SwiftUI

public struct CharacterDetailsView: View {
    let viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        ZStack {
            StarsBackgroundView()
            
            VStack(spacing: 8.0) {
                Group {
                    AsyncImage(url: viewModel.imageURL) { image in
                        image
                            .asCircularImage()
                    } placeholder: {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle(tint: .neonGreen))
                    }
                    .frame(width: 150.0, height: 150.0, alignment: .leading)
                    
                    CharacterInfoView(name: viewModel.name,
                                      status: viewModel.status,
                                      origin: viewModel.origin,
                                      species: viewModel.species)
                }
                .padding(16.0)
            }
            .background(Color.darkBlue)
            .cornerRadius(4)
            .padding(32.0)
            .shadow(color: .neonGreen.opacity(0.7), radius: 30.0)
            .offset(y: -50)
        }
    }
}

struct CharacterDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No Preview")
//        CharacterDetailsView(viewModel: CharacterDetailsView.ViewModel(character: Character.dummyCharacter().first! ))
    }
}
