//
//  Item.swift
//  DriveEasy
//
//  Created by Rashid Alshehhi on 21/10/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
