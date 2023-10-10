//
//  CharacterOverView.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-19.
//

import SwiftUI
import Shared
import Favorites

struct CharacterOverView: View {
    @StateObject var viewModel: CharacterOverView.ViewModel
    
    init(viewModel: CharacterOverView.ViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        NavigationView {
            ZStack {
                StarsBackgroundView()
                
                TabView {
                    Group {
                        CharacterList(viewModel.characters, pageNumber: $viewModel.pageNumber)
                            .tabItem {
                                
                                Image(uiImage: UIImage.sharedImage(named: "iconTab1"))
                            }
                        
                        FavoriteCharacterList(viewModel.characters, pageNumber: $viewModel.pageNumber)
                            .tabItem {
                                Image(uiImage: UIImage.sharedImage(named: "iconTab0"))
                            }
                    }
                    .toolbarBackground(Color.darkBlue, for: .tabBar)
                }
                .accentColor(.neonGreen)
            }
        }
        .task(id: viewModel.pageNumber) {
            await viewModel.getCharacters()
        }
    }
}

struct CharacterOverView_Previews: PreviewProvider {
    static var previews: some View {
        let service = NetworkService()
        let vm = CharacterOverView.ViewModel(service: service)
        
        CharacterOverView(viewModel: vm)
    }
}
