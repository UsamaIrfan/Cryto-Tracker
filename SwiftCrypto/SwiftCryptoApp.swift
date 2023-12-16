//
//  SwiftCryptoApp.swift
//  SwiftCrypto
//
//  Created by Map Mac on 28/10/2023.
//

import SwiftUI

@main
struct SwiftCryptoApp: App {
    
    @StateObject private var vm = HomeViewModel()
    @State private var showLaunchView: Bool = true
    
    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor(Color.accent)]
    }
    
    var body: some Scene {
        WindowGroup {
            
            ZStack {
                
                NavigationStack {
                    HomeView()
                        .toolbar(.hidden, for: .navigationBar)
                        .navigationDestination(for: AppRoutes.self, destination: {value in
                            switch (value) {
                                case .home:
                                    HomeView()
                                case .coinDetail(let coin):
                                    DetailView(coin: coin)
                            }
                        })
                }
                .environmentObject(vm)
                
                ZStack {
                    if (showLaunchView) {
                        LaunchView(showLaunchView: $showLaunchView)
                            .transition(.move(edge: .leading))
                    }
                }
                .zIndex(2.0)
                
            }
        }
    }
}
