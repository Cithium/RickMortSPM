//
//  StarsBackgroundView.swift
//  RickMortyApp
//
//  Created by Hamza on 2023-06-20.
//

import SwiftUI

public struct StarsBackgroundView: View {
    public init() {} 
    
    public var body: some View {
        Image("stars", bundle: Bundle.module)
            .resizable()
            .aspectRatio(contentMode: .fill)
            .frame(minWidth: 0, maxWidth: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}

struct StarsBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        StarsBackgroundView()
    }
}
