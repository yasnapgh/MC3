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
            ZStack(alignment: .bottom) {
                Image("welcome1")
                    .resizable()
                    .scaledToFill()
                    .edgesIgnoringSafeArea(.all)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)

               
                   
                NavigationLink {
                                    ButtonsView()
                                } label: {
                                    Text("Start the Journey")
                                        .font(Font.custom("SF Pro", size: 37).weight(.semibold))
                                        .foregroundColor(.purple)
                                        .padding()
                                        .background(Color.white.opacity(0.7))
                                        .cornerRadius(10)
                                        .padding(.bottom , 80)
                                }
            }
        }
    }
}

#Preview {
    ContentView()
}
