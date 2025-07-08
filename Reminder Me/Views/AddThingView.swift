//
//  AddThingView.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI
import SwiftData

struct AddThingView: View {
    
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) private var context
    @State private var thingTitle = ""
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10)  {
            
            TextField("What makes you feel good?", text: $thingTitle)
                .textFieldStyle(.roundedBorder)
            Button("Add"){
                // add into swiftdata
                addThing()
                
                thingTitle = ""
                
                dismiss()
            }
            .buttonStyle(.borderedProminent)
            .disabled(thingTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty)
        }
        .padding()
    }
    
    func addThing(){
        let cleanedTitle = thingTitle.trimmingCharacters(in: .whitespacesAndNewlines)
        
        context.insert(Thing(title: cleanedTitle))
        try? context.save()
    }
}

#Preview {
    AddThingView()
}
