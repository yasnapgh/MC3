import SwiftUI

struct RelaxColorInCircleView: View {
    
    @State private var colors: [Color] = [
       
        Color(red: 184/255, green: 208/255, blue: 0/255), 
        Color(red: 176/255, green: 206/255, blue: 0/255),
        Color(red: 170/255, green: 204/255,blue: 0/255),
        Color(red: 137/255, green: 189/255,blue: 19/255),
        Color(red: 112/255, green: 178/255, blue: 33/255),
        Color( red: 85/255, green: 166/255,blue: 48/255),
        Color(red: 64/255, green: 157/255, blue: 60/255),
        Color(red: 43/255,green: 147/255, blue: 72/255),
        Color(red: 21/255, green: 137/255, blue: 84/255),
        Color(red: 0/255, green: 127/255, blue: 95/255),
        Color(red: 0/255, green: 137/255, blue: 70/255 ),
        Color(red: 0/255, green: 147/255, blue: 60/255),
        Color(red: 0/255, green: 157/255, blue: 50/255),
        Color(red: 0/255, green: 175/255, blue: 40/255),
        Color(red: 0/255, green: 200/255, blue: 30/255)
        
    ]
    
    @State private var durations: [Double] = [
    
        5,
        10,
        5,
        10,
        5,
        10,
        5,
        10,
        5,
        30
        
        
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
    RelaxColorInCircleView()
}

