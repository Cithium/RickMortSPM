//
//  File.swift
//  
//
//  Created by Hamza on 2023-07-10.
//

import Foundation
import UIKit

extension UIImage {
    public static func sharedImage(named name: String) -> UIImage {
        return UIImage(named: name, in: Bundle.module, with: nil)!
    }
}
