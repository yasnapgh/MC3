//
//  ContentView.swift
//  MC3
//
//  Created by khadija Ait ElFqih on 19/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Image ("welcome")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                    .ignoresSafeArea()
                
                
                NavigationLink {
                    ButtonsView()
                } label: {
                    Text("Start the Journey")
                        .font(Font.custom("SF Pro", size: 37).weight(.semibold))
                        .foregroundColor(.purple)
                }
                
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}
