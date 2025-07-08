//
//  Day.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import Foundation
import SwiftData

@Model
class Day : Identifiable {
    
    var id: String = UUID().uuidString
    var date: Date = Date()
    var things = [Thing]()
    
    init(){}
    
}
