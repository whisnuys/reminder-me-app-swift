//
//  SettingsView.swift
//  Reminder Me
//
//  Created by whisnuys on 08/07/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        VStack (alignment: .leading, spacing: 20) {
            
            Text("Settings")
                .font(.largeTitle)
                .bold()
            
            List {
                
                // Rate the app
                let reviewUrl = URL(string: "")!
                
                
                Link(destination: reviewUrl, label: {
                    
                    HStack {
                        Image(systemName: "star.bubble")
                        Text("Rate the app")
                    }
                    
                })
                
                // Recommend the app
                let shareUrl = URL(string: "")!
                
                ShareLink(item: shareUrl) {
                    HStack {
                        Image(systemName: "arrowshape.turn.up.right")
                        Text("Recommend the app")
                    }
                    
                }
                
                // Contact
                Button  {
                    // Compose email
                    let mailUrl = createMailUrl()
                    
                    if let mailUrl = mailUrl, UIApplication.shared.canOpenURL(mailUrl) {
                        UIApplication.shared.open(mailUrl)
                    }
                    else {
                        print("Couldn't open mail client")
                    }
                    
                } label: {
                    HStack {
                        Image(systemName: "quote.bubble")
                        Text("Submit feedback")
                    }
                    
                }
                
                
                // Privacy Policy
                let privacyUrl = URL(string: "")!
                
                Link(destination: privacyUrl, label: {
                    
                    HStack {
                        Image(systemName: "magnifyingglass")
                        Text("Privacy Policy")
                    }
                })
                
                
            }
            .listRowSeparator(.hidden)
            .listStyle(.plain)
            .tint(.black)
        }
    }
    
    func createMailUrl() -> URL? {
        
        var mailUrlComponents = URLComponents()
        mailUrlComponents.scheme = "mailto"
        mailUrlComponents.path = "whisnusaputra30@gmail.com"
        mailUrlComponents.queryItems = [
            URLQueryItem(name: "subject", value: "Feedback for Reminder Me app")
        ]
        
        return mailUrlComponents.url
    
    }
}

#Preview {
    SettingsView()
}
