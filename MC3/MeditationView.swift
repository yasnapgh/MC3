import SwiftUI

struct MeditationColorInCircleView: View {
    
    @State private var colors: [Color] = [
        Color(red: 252/255, green: 191/255, blue: 64/255), // Yellow
        Color(red: 250/255, green: 163/255, blue: 7/255), // Orange
        Color(red: 244/255, green: 140/255, blue: 6/255), // Dark orange
        Color(red: 238/255, green: 116/255, blue: 5/255),
        Color(red: 232/255, green: 93/255,blue: 4/255),
        Color(red: 226/255, green: 72/255,blue: 3/255),
        Color(red: 220/255, green: 47/255, blue: 2/255),
        Color( red: 215/255, green: 28/255,blue: 1/255),
        Color(red: 208/255, green: 0/255, blue: 0/255),
        Color(red: 238/255,green: 0/255, blue: 0/255),
        Color(red: 245/255, green: 0/255, blue: 0/255),
        Color(red: 255/255, green: 0/255, blue: 0/255)
    ]
    
    @State private var durations: [Double] = [
        5,
        10,
        5,
        10,
        5,
        10,
        5,
        40
    ]
    
    @State private var colorIndex: Int = 0
    
    var body: some View {
        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            Circle()
                .foregroundColor(colors[colorIndex])
                .frame(width: 400 , height: 400 )
            
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
    MeditationColorInCircleView()
}

