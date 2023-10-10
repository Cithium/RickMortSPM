//
//  Image+ViewModifiers.swift
//  
//
//  Created by Hamza on 2023-07-08.
//

import Foundation
import SwiftUI

public extension Image {
    func asCircularImage() -> some View {
        self.resizable()
            .aspectRatio(contentMode: .fit)
            .clipShape(Circle())
    }
    
    func asIconImage(width: CGFloat, height: CGFloat) -> some View {
        self.resizable()
        .aspectRatio(contentMode: .fit)
        .foregroundColor(.green)
        .frame(width: width, height: height)
        .foregroundColor(.neonGreen)
    }
}

public struct TransparentNavigationLink<Destination: View>: View {
    let destination: Destination
    
    public init(destination: Destination) {
        self.destination = destination
    }
    
    public var body: some View {
        NavigationLink {
            destination
        } label: {
            EmptyView()
        }
        .opacity(0)
    }
}
