//
//  Reminder_MeApp.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI
import SwiftData

@main
struct ReminderApp: App {
    var body: some Scene {
        WindowGroup {
            HomeView()
                .modelContainer(for: [Day.self, Thing.self])
        }
    }
}
