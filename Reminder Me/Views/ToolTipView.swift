//
//  ToolTipView.swift
//  Reminder Me
//
//  Created by whisnuys on 10/07/25.
//

import SwiftUI

struct ToolTipView: View {
    
    var text: String
    
    var body: some View {
        Text(text)
            .foregroundStyle(Color.green)
            .padding()
            .background(Color("light-green"))
            .cornerRadius(10)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.green, lineWidth: 1)
            )
    }
}

#Preview {
    ToolTipView(text: "Hello, World!")
}
