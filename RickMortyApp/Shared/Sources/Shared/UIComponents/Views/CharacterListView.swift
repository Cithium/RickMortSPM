//
//  ListView.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-19.
//

import SwiftUI

public struct CharacterList<Content>: View where Content: View {
    let characters: [Character]
    @Binding var pageNumber: Int
    let emptyStateView: Content
    
    init(_ characters: [Character], pageNumber: Binding<Int>, @ViewBuilder emptyStateView: () -> Content) {
        self.characters = characters
        self._pageNumber = pageNumber
        self.emptyStateView = emptyStateView()
    }
    
    public var body: some View {
        ZStack {
            StarsBackgroundView()
            
            List(characters) { character in
                CharacterRowView(viewModel: CharacterRowView.ViewModel(character: character))
                    .overlay(
                        TransparentNavigationLink(destination: CharacterDetailsView(viewModel: CharacterDetailsView.ViewModel(character: character)))
                    )
                    .onAppear {
                        if character == characters.last {
                            pageNumber += 1
                        }
                    }
            }
            .scrollContentBackground(.hidden)
            
            emptyStateView
        }
    }
}

struct CharacterList_Previews: PreviewProvider {
    static var previews: some View {
        Text("No Preview")
//        CharacterList(Character.dummyCharacter(), pageNumber: .constant(1)) {
//            Text("Empty")
//        }
    }
}

extension CharacterList where Content == EmptyView {
    public init(_ characters: [Character], pageNumber: Binding<Int>) {
        self.init(characters, pageNumber: pageNumber) {
            EmptyView()
        }
    }
}
