//
//  File.swift
//  
//
//  Created by Hamza on 2023-07-13.
//

import Foundation
import SwiftUI

extension Font {
    public struct LCD {
        
        /// Returns a fixed-size font of the specified style.
        public static func fixed(_ style: LCDFont, size: CGFloat) -> Font {
            return Font.custom(style.name, fixedSize: size)
        }
        
        /// Returns a relative-size font of the specified style.
        public static func relative(_ style: LCDFont, size: CGFloat, relativeTo
                                    textStyle: Font.TextStyle) -> Font {
            return Font.custom(style.name, size: size, relativeTo: textStyle)
        }
    }
}
