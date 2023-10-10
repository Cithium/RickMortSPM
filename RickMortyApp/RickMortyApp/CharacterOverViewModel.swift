//
//  CharacterOverViewModel.swift
//  RickAndMorty
//
//  Created by Hamza on 2023-06-18.
//

import Foundation
import Shared

extension CharacterOverView {
    @MainActor
    public class ViewModel: ObservableObject {
        private var info: Info?
        @Published var characters: [Character] = []
        @Published var isLoading = true
        @Published var pageNumber = 1
        
        var service: Service
        
        init(service: Service) {
            self.service = service
        }
        
        func getCharacters() async {
            defer {
                isLoading = false
            }
            
            isLoading = true
            do {
                if characters.isEmpty && info == nil {
                    
                    let result: CharacterResult = try await service.getModels(with: NetworkService.baseURL)
                    info = result.info
                    characters = result.characters
                } else {
                    guard let url = info?.next else { return }
                    let result: CharacterResult = try await service.getModels(with: url)
                    info = result.info
                    characters.append(contentsOf: result.characters)
                }
                
            } catch {
                print(error.localizedDescription)
            }
        }
    }
}
