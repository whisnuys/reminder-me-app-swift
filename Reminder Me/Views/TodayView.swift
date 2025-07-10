//
//  TodayView.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI
import SwiftData

struct TodayView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(filter: Day.currentDayPredicate(), sort: \.date) private var today: [Day]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Today")
                .font(.largeTitle)
                .bold()
            
            Text("Try to do things that make you feel positive today.")
            
            // Only display the list if there are things done today
            if getToday().things.count > 0 {
                List(getToday().things){ thing in
                    Text(thing.title)
                }
                .listStyle(.plain)
            } else {
                // TODO: Display the image and some tool tips
            }
        }
    }
    
    func getToday() -> Day{
        // try to retrieve today from the database
        if today.count > 0 {
            return today.first!
        }
        else {
            // if it doesnt exist, create a day and insert it
            let today = Day()
            context.insert(today)
            try? context.save()
            
            return today
        }
    
       
    }
}

#Preview {
    TodayView()
}
