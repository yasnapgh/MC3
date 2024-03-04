import SwiftUI

struct FocusColorInCircleView: View {
    
    let outerCircleColors: [Color] = [
        
        Color(red: 2/255, green: 62/255, blue: 138/255),
        Color(red: 2/255, green: 45/255, blue: 125/255),
        ]
    
    let innerCircleColors: [Color] = [
        
                
                Color(red: 21/255, green: 100/255, blue: 167/255),
                Color(red: 11/255,green: 80/255, blue: 152/255),
                Color(red: 2/255, green: 62/255, blue: 138/255),
                Color(red: 2/255, green: 45/255, blue: 125/255),
                Color(red: 3/255, green: 28/255, blue: 112/255 )
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
        10,
        5,
        10
    ]
    
    
    @State private var outerCircleScale: CGFloat = 0.3
    @State private var innerCircleScale: CGFloat = 0.1
    @State private var outerCircleColorIndex = 0
    @State private var innerCircleColorIndex = 0
    
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()
            Circle()
                .fill(outerCircleColors[outerCircleColorIndex])
                .frame(width: 700 * outerCircleScale, height: 700 * outerCircleScale)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 5).repeatForever()) {
                        outerCircleScale = 0.9
                    }
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                        outerCircleColorIndex = (outerCircleColorIndex + 1) % outerCircleColors.count
                    }
                }
            
            Circle()
                .fill(innerCircleColors[innerCircleColorIndex])
                .frame(width: 300 * innerCircleScale, height: 300 * innerCircleScale)
                .onAppear {
                    withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
                        innerCircleScale = 0.9
                    }
                    withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
                        innerCircleColorIndex = (innerCircleColorIndex + 1) % innerCircleColors.count
                    }
                }
        }
    }
}

struct FocusColorInCircleView_Previews: PreviewProvider {
    static var previews: some View {
        FocusColorInCircleView()
    }
}
