//
//  TestingDescView.swift
//  MC3
//
//  Created by Yasna Pourgholamhosseini on 05/03/24.
//

import SwiftUI

struct RainbowCircleView: View {
    @State private var yOffset: CGFloat = 0
    @State private var isAnimating = false
    @State private var isYellow = false

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            VStack() {
                Spacer()
                // Circle moving UP
                ZStack {
                    Circle()
                        .fill(isYellow ? Color(red: 184/255, green: 208/255, blue: 0/255) : Color.white)
                        .frame(width: 200, height: 200)

                    Circle()
                        .trim(from: 0, to: 1)
                        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round))
                        .fill(isYellow ? AngularGradient(
                            gradient: Gradient(colors: isAnimating ? [Color(red: 184/255, green: 208/255, blue: 0/255),] : [.pink, .white, .green, .white, .pink]),
                            center: .center,
                            startAngle: .zero,
                            endAngle: .degrees(360)
                        ) : AngularGradient(
                            gradient: Gradient(colors: isAnimating ? [.pink, .white, .green, .white, .pink] : [.pink, .white, .green, .white, .pink]),
                            center: .center,
                            startAngle: .zero,
                            endAngle: .degrees(360)
                        ))
                        .blur(radius: 8)
                        .frame(width: 200, height: 200)
                        .rotationEffect(Angle(degrees: 90))
                        

                    Button("Start") {
                                           withAnimation(Animation.easeInOut(duration: 2.0)) { // Adjust the duration as needed
                                               yOffset = UIScreen.main.bounds.height / 2 - 100
                                               isAnimating = true
                                               isYellow = true
                                           }
                                       }
                                       .font(.largeTitle)
                                       .foregroundColor(.black)
                                   }
                                   .padding(.bottom)
                                   .offset(y: isAnimating ? -yOffset : 0)
                               }
                           }
                       }
                   }
struct RainbowCircleView_Previews: PreviewProvider {
    static var previews: some View {
        RainbowCircleView()
    }
}
