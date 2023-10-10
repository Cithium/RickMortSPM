//
//  File.swift
//  
//
//  Created by Hamza on 2023-07-13.
//

import Foundation
import SwiftUI

public struct LCDFont {
   public let name: String

   private init(named name: String) {
      self.name = name
      do {
         try registerFont(named: name)
      } catch {
         let reason = error.localizedDescription
         fatalError("Failed to register font: \(reason)")
      }
   }

   public static let solid = LCDFont(named: "LCDSolid")
}
