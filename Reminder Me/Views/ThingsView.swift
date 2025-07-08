//
//  ThingsView.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI
import SwiftData

struct ThingsView: View {
    
    @Query(filter: #Predicate<Thing> { $0.isHidden == false }) private var things: [Thing]
    
    @State private var showAddView: Bool = false
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            Text("Things")
                .font(.largeTitle)
                .bold()
            
            Text("These are the things that make you feel positive and uplifted.")
            
            List (things){ thing in
                Text(thing.title)
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
        .sheet(isPresented: $showAddView, content: {
            AddThingView()
                .presentationDetents([.fraction(0.2)])
        })
    }
}

#Preview {
    ThingsView()
}
