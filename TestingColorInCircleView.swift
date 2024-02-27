//
//  TestingColorInCircleView.swift
//  MC3
//
//  Created by Yasna Pourgholamhosseini on 27/02/24.
//

import SwiftUI

struct TestingColorInCircleView: View {
    
    @State private var colors: [Color] = [
        Color(red: 252/255, green: 191/255, blue: 64/255),
        Color(red: 232/255, green: 93/255,blue: 255/255),
        Color(red: 0/255, green: 93/255,blue: 255/255),
        Color(red: 232/255, green: 0/255,blue: 255/255),
        Color(red: 232/255, green: 93/255,blue: 0/255),
    ]
    
    @State private var durations: [Double] = [
        5,
        10,
        5,
        10,
        5
    ]
    
    @State private var colorIndex: Int = 0
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(colors[colorIndex])
            
                .onTapGesture {
                    startColorTransition()
                }
        }
    }
    
    func changeColor() {
        withAnimation(
            Animation
                .linear(duration: 2)
                .repeatForever(autoreverses: true)
        ) {
            self.colorIndex = self.colorIndex + 1
        }
        
        print("Changing color from \(colorIndex) to \(colorIndex + 1)")
    }
    
    func startColorTransition() {
        
        var accumulatedDurations: Double = 0
        
        for duration in durations {
            
            DispatchQueue.main.asyncAfter(deadline: .now() + accumulatedDurations) {
                changeColor()
                
            }
            
            accumulatedDurations += duration
            print("Accumulate Durations: \(accumulatedDurations)")
            
        }
        
    }
    
}

#Preview {
    TestingColorInCircleView()
}
