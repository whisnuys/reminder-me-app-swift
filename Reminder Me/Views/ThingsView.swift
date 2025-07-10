//
//  ThingsView.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI
import SwiftData

struct ThingsView: View {
    
    @Environment(\.modelContext) private var context
    
    @Query(filter: Day.currentDayPredicate(), sort: \.date) private var today: [Day]
    
    @Query(filter: #Predicate<Thing> { $0.isHidden == false }) private var things: [Thing]
    
    @State private var showAddView: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20){
            Text("Things")
                .font(.largeTitle)
                .bold()
            
            Text("These are the things that make you feel positive and uplifted.")
            
            List (things){ thing in
                
                let today = getToday()
                
                HStack {
                    Text(thing.title)
                    Spacer()
                    Button{
                        
                        if today.things.contains(thing){
                        
                            // remove the thing from today
                            today.things.removeAll { t in
                                t == thing
                            }
                            
                            try? context.save()
                            
                        } else {
                            // add the thing to today
                            today.things.append(thing)
                        }
                        
                        
                    } label: {
                        
                        //if this thing is already in Today's things list, show a solid checkmark instead
                        if today.things.contains(thing){
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundStyle(.blue)
                        } else {
                            Image(systemName: "checkmark.circle")
                        }
                        
                        
                    }
                }
            }
            .listStyle(.plain)
            
            Spacer()
            
            Button("Add New Thing"){
                // Show sheet to add thing
                showAddView.toggle()
            }
            .buttonStyle(.borderedProminent)
            .frame(maxWidth: .infinity, alignment: .center)
            
            Spacer()
        }
        .sheet(isPresented: $showAddView) {
            AddThingView()
                .presentationDetents([.fraction(0.2)])
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
    ThingsView()
}
