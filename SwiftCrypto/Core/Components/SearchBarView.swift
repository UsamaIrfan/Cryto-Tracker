//
//  SearchBarView.swift
//  SwiftCrypto
//
//  Created by Map Mac on 30/10/2023.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    var body: some View {
        HStack {
            Image(systemName: "magnifyingglass")
            
            TextField("Search by name or symbol ... ", text: $searchText)
                .autocorrectionDisabled()                
                .foregroundStyle(searchText.isEmpty ? Color.secondaryText : Color.accent)
                .overlay (alignment: .trailing) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(Color.accent)
                        .padding()
                        .offset(x: 10)
                        .opacity(searchText.isEmpty ? 0.0 : 1.0)
                        .onTapGesture {
                            searchText = ""
                            UIApplication.shared
                                .endEditing()
                        }
                }
        }
        .font(.headline)
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 25)
                .fill(Color.background)
                .shadow(color: Color.accent.opacity(0.15), radius: 10)
        )
        .padding()
    }
}

#Preview("Home Search Bar", traits: .sizeThatFitsLayout, body: {
    SearchBarView(searchText: .constant(""))
})
