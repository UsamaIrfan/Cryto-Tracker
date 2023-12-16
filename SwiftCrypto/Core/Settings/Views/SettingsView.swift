//
//  SettingsView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 29/11/2023.
//

import SwiftUI

struct SettingsView: View {
    
    @Environment(\.dismiss) private var dismiss: DismissAction
    
    let defaultURL = URL(string: "https://www.google.com")!
    let githubURL = URL(string: "https://www.github.com/UsamaIrfan")!
    let linkedinURL = URL(string: "https://www.linkedin.com/in/usama-irfan")!
    let coingeckoURL = URL(string: "https://www.coingecko.com")!
    let personalURL = URL(string: "https://www.usamairfan.com")!
    let swiftfulThinkingURL = URL(string: "https://www.youtube.com/c/swiftfulthinking")!
    
    var body: some View {
        NavigationStack {
            List {
                linksSection
                coingeckoSection
                developerSection
            }
            .listStyle(GroupedListStyle())
            .navigationTitle("Settings")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        XMarkButton()
                    })
                }
            }
        }
    }
}

extension SettingsView {
    private var linksSection: some View {
        Section(header: Text("About this app")) {
            VStack (alignment: .leading) {
                Image("logo")
                    .resizable()
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("This is app was made by following a @SwiftfulThinking course on Youtube. It uses MVVM architecture, Combine, and CoreData.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.accent)
            }
            .padding(.vertical)
            
            Link("Follow me on Github", destination: githubURL)
            Link("Follow me on Linkedin", destination: linkedinURL)
            Link("Subscribe to @SwiftfulThinking", destination: swiftfulThinkingURL)
            
        }
    }
    
    private var coingeckoSection: some View {
        Section(header: Text("Coin Gecko")) {
            VStack (alignment: .leading) {
                Image("coingecko")
                    .resizable()
                    .scaledToFit()
                    .frame(height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Text("The crypto currency data that is used in this app comes from a free API from CoinGecko! Prices maybe a slightly delayed.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.accent)
            }
            .padding(.vertical)
            
            Link("Visit Coingecko", destination: coingeckoURL)
            
        }
    }
    
    private var developerSection: some View {
        Section(header: Text("Developer")) {
            VStack (alignment: .leading) {
                HStack {
                    Image("developer")
                        .resizable()
                        .scaledToFit()
                        .frame(height: 100)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                    
                    Text("Usama Irfan")
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.accent)
                }
                
                Text("This app was developed by Usama Irfan. It uses SwiftUI. The project benefits from multi-threading, publishers/subscribers, data persistance, and is completely data-driven. I am a Software Engineer with over 4 years of experience in developing Web and mobile applications with diverse toolkit of technologies. You can learn more about me on my linkedin or my portfolio.")
                    .font(.callout)
                    .fontWeight(.medium)
                    .foregroundStyle(Color.accent)
            }
            .padding(.vertical)
            
            Link("Learn more about me", destination: personalURL)
            
        }
    }
}

#Preview {    
    SettingsView()
}
