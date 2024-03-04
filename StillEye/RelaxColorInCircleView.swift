import SwiftUI

struct RelaxColorInCircleView: View {
    
    let outerCircleColors: [Color] = [
        
               
               Color(red: 0/255, green: 157/255, blue: 50/255),
               Color(red: 0/255, green: 175/255, blue: 40/255),
               Color(red: 0/255, green: 200/255, blue: 30/255)
               
    ]
    
    let innerCircleColors: [Color] = [
       
               Color(red: 43/255,green: 147/255, blue: 72/255),
               Color(red: 21/255, green: 137/255, blue: 84/255),
               Color(red: 0/255, green: 127/255, blue: 95/255),
               Color(red: 0/255, green: 137/255, blue: 70/255 ),
               Color(red: 0/255, green: 147/255, blue: 60/255),
               Color(red: 0/255, green: 157/255, blue: 50/255),
               
               
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
                    startOuterCircleColorTransition()
                    startOuterCircleScaleAnimation()
                }
            
            Circle()
                .fill(innerCircleColors[innerCircleColorIndex])
                .frame(width: 300 * innerCircleScale, height: 300 * innerCircleScale)
                .onAppear {
                    startInnerCircleColorTransition()
                    startInnerCircleScaleAnimation()
                }
        }
    }
    
    func startOuterCircleColorTransition() {
        withAnimation(Animation.easeInOut(duration: 5).repeatForever()) {
            outerCircleColorIndex = (outerCircleColorIndex + 1) % outerCircleColors.count
        }
    }
    
    func startOuterCircleScaleAnimation() {
        withAnimation(Animation.easeInOut(duration: 3).repeatForever()) {
            outerCircleScale = 0.9
        }
    }
    
    func startInnerCircleColorTransition() {
        withAnimation(Animation.easeInOut(duration: 2).repeatForever()) {
            innerCircleColorIndex = (innerCircleColorIndex + 1) % innerCircleColors.count
        }
    }
    
    func startInnerCircleScaleAnimation() {
        withAnimation(Animation.easeInOut(duration: 1.5).repeatForever()) {
            innerCircleScale = 0.9
        }
    }
}

struct RelaxColorInCircleView_Previews: PreviewProvider {
    static var previews: some View {
        RelaxColorInCircleView()
    }
}
