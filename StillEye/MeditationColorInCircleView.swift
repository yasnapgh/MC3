import SwiftUI

struct MeditationColorInCircleView: View {
    
    let outerCircleColors: [Color] = [
        
        Color(red: 215/255, green: 28/255,blue: 1/255),
        Color(red: 208/255, green: 0/255, blue: 0/255),
        Color(red: 238/255,green: 0/255, blue: 0/255),
        Color(red: 245/255, green: 0/255, blue: 0/255),
        Color(red: 255/255, green: 0/255, blue: 0/255)
    ]
    
    let innerCircleColors: [Color] = [
        
                Color(red: 220/255, green: 47/255, blue: 2/255),
                Color( red: 215/255, green: 28/255,blue: 1/255),
                Color(red: 208/255, green: 0/255, blue: 0/255),
                Color(red: 238/255,green: 0/255, blue: 0/255),
                Color(red: 245/255, green: 0/255, blue: 0/255),
                Color(red: 255/255, green: 0/255, blue: 0/255)

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

struct MeditationColorInCircleView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationColorInCircleView()
    }
}
