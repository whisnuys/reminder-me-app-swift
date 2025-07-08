//
//  Thing.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import Foundation
import SwiftData

@Model
class Thing: Identifiable {
    
    var id: String = UUID().uuidString
    var title: String = ""
    var lastUpdated: Date = Date()
    var isHidden: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
