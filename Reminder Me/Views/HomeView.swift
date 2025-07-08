//
//  HomeView.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        
        TabView{
            TodayView()
                .tabItem {
                    Text("Today")
                    Image(systemName: "calendar")
                }
            ThingsView()
                .tabItem {
                    Text("Things")
                    Image(systemName: "heart")
                }
            RemindersView()
                .tabItem {
                    Text("Reminders")
                    Image(systemName: "bell")
                }
            SettingsView()
                .tabItem {
                    Text("Settings")
                    Image(systemName: "gear")
                }
        }
        .padding()
    }
}

#Preview {
    HomeView()
}
