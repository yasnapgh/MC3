import SwiftUI

struct FocusColorInCircleView: View {
    
    @State private var colors: [Color] = [
       
        Color(red: 49/255, green: 200/255, blue: 247/255),
        Color(red: 33/255, green: 169/255, blue: 249/255),
        Color(red: 37/255, green: 183/255,blue: 236/255),
        Color(red: 42/255, green: 165/255,blue: 219/255),
        Color(red: 46/255, green: 151/255, blue: 206/255),
        Color( red: 34/255, green: 126/255,blue: 187/255),
        Color(red: 21/255, green: 100/255, blue: 167/255),
        Color(red: 11/255,green: 80/255, blue: 152/255),
        Color(red: 2/255, green: 62/255, blue: 138/255),
        Color(red: 2/255, green: 45/255, blue: 125/255),
        Color(red: 3/255, green: 28/255, blue: 112/255 )
        
    
    ]
    
    @State private var durations: [Double] = [
    
        5,
        15,
        4,
        16,
        3,
        17,
        2,
        18,
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
    FocusColorInCircleView()
}

