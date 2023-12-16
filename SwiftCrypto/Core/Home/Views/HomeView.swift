//
//  HomeView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 28/10/2023.
//

import SwiftUI

// MARK: HomeView
struct HomeView: View {
    
    @EnvironmentObject private var vm: HomeViewModel
    @State private var showPortfolio: Bool = false
    @State private var showPortfolioView: Bool = false
    @State private var showSettingsSheet: Bool = false
    
    var body: some View {
        ZStack {
            
            // background
            Color.background
                .ignoresSafeArea()
                .sheet(isPresented: $showPortfolioView, content: {
                    PortfolioView()
                        .environmentObject(vm)
                })
            
            // Content
            VStack {
                homeHeader
                HomeStatsView(showPortfolio: $showPortfolio)
                SearchBarView(searchText: $vm.searchText)
                
                listHeader
                
                if (!showPortfolio) {
                    allCoinsList
                        .transition(.move(edge: .leading))
                }
                if (showPortfolio) {
                    portfolioCoinsList
                        .transition(.move(edge: .trailing))
                }
                
                
                
                Spacer(minLength: 0)
            }
            .sheet(isPresented: $showSettingsSheet, content: {
                SettingsView()
            })
        }
    }
}

// MARK: Preview
struct HomeView_Preview: PreviewProvider {
    static var previews: some View {
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
        .environmentObject(dev.homeVM)
    }
}

// MARK: Components
extension HomeView {
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showPortfolio ? "plus" : "info")
                .animation(.none, value: showPortfolio)
                .onTapGesture {
                    if (showPortfolio) {
                        showPortfolioView.toggle()
                    } else {
                        showSettingsSheet.toggle()
                    }
                }
                .background(
                    CircleButtonAnimatedView(animate: $showPortfolio)
                )
            Spacer()
            Text("Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundStyle(.accent)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(Angle(degrees: showPortfolio ? 180 : 0))
                .onTapGesture {
                    withAnimation(.spring) {
                        showPortfolio.toggle()
                    }
                }
        }
        .padding(.horizontal)
    }
    
    private var allCoinsList: some View {
        List {
            ForEach(vm.allCoins) { coin in
                NavigationLink(value: AppRoutes.coinDetail(coin: coin)) {
                    CoinRowView(coin: coin, showHoldingsColumn: false)
                        .listRowInsets(.init(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8)))
                }
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))
            }
        }
        .listStyle(PlainListStyle())
    }
    
    
    private var portfolioCoinsList: some View {
        List {
            ForEach(vm.portfolioCoins) { coin in
                NavigationLink(value: AppRoutes.coinDetail(coin: coin)) {
                    CoinRowView(coin: coin, showHoldingsColumn: true)
                        .listRowInsets(.init(EdgeInsets(top: 10, leading: 8, bottom: 10, trailing: 8)))
                }
            }
        }
        .listStyle(PlainListStyle())
    }
    
    private var listHeader: some View {
        HStack {
            HStack(spacing: 4) {
                Text("Coin")
                Image(systemName: "chevron.down")
                    .opacity((vm.sortOption == .rank || vm.sortOption == .rankReversed) ? 1.0 : 0.0)
                    .rotationEffect(Angle(degrees: vm.sortOption == .rank ? 0 : 180))
            }
            .onTapGesture {
                withAnimation(.default) {
                    vm.sortOption = vm.sortOption == .rank ? .rankReversed : .rank
                }
            }
            Spacer()
            if showPortfolio {
                HStack (spacing: 4) {
                    Text("Holdings")
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .holdings || vm.sortOption == .holdingReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .holdings ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .holdings ? .holdingReversed : .holdings
                    }
                }
            }
            HStack {
                
                HStack(spacing: 4) {
                    Text("Price")
                        .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
                    Image(systemName: "chevron.down")
                        .opacity((vm.sortOption == .price || vm.sortOption == .priceReversed) ? 1.0 : 0.0)
                        .rotationEffect(Angle(degrees: vm.sortOption == .price ? 0 : 180))
                }
                .onTapGesture {
                    withAnimation(.default) {
                        vm.sortOption = vm.sortOption == .price ? .priceReversed : .price
                    }
                }
                
                Button {
                    vm.reloadData()
                } label: {
                    Image(systemName: "goforward")
                }
                .rotationEffect(Angle(degrees: vm.isLoading ? 360 : 0), anchor: .center)
                
            }
        }
        .font(.caption)
        .foregroundStyle(.secondaryText)
        .padding(.horizontal, 25)
    }
}
