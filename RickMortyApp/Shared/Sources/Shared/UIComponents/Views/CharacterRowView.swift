//
//  CharacterCardView.swift
//  RickAndMorty
//
//  Created by Hamza on 2023-06-19.
//

import SwiftUI

public struct CharacterRowView: View {
    let viewModel: ViewModel
    
    public init(viewModel: ViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        HStack(spacing: 8.0) {
            AsyncImage(url: viewModel.imageURL) { image in
                image
                    .asCircularImage()
            } placeholder: {
                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(tint: .neonGreen))
            }
            .frame(width: 75.0, height: 75.0, alignment: .center)
            
            VStack(alignment: .leading, spacing: 0) {
                HStack(spacing: 20.0) {
                    Group {
                        Text("Name:")
                            .foregroundColor(.white)
                        Text(viewModel.name)
                            .foregroundColor(.neonGreen)
                    }
                    .font(.LCD.fixed(.solid, size: 12.5))
                }
                
                HStack(spacing: 4) {
                    Group {
                        Text("Status:")
                            .foregroundColor(.white)
                        Text(viewModel.status)
                            .foregroundColor(.neonGreen)
                    }
                    .font(.LCD.fixed(.solid, size: 12.5))
                }
            }
            
            Spacer()
            
            Image("emptyHeart")
                .asIconImage(width: 44, height: 44)

        }
            .frame(maxWidth: .infinity)
            .frame(height: 165)
            .padding(.horizontal)
            .background(Color.darkBlue)
            .cornerRadius(4)
            .shadow(color: .neonGreen.opacity(0.7), radius: 7.0)
            .buttonStyle(.plain)
            .listRowSeparator(.hidden)
            .listRowBackground(Color.clear)
    }
}

struct CharacterRowView_Previews: PreviewProvider {
    static var previews: some View {
        Text("No Preview")
//        let vm = CharacterRowView.ViewModel(character: Character.dummyCharacter().first!)
//        CharacterRowView(viewModel: vm)
    }
}
