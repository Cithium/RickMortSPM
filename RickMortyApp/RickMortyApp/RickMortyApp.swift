//
//  RickMortyApp.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-18.
//

import SwiftUI
import Shared

@main
struct RickMortyApp: App {
    let service = NetworkService()
    
    
    var body: some Scene {
        WindowGroup {
            CharacterOverView(viewModel: CharacterOverView.ViewModel(service: service))
        }
    }
}
