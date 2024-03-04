//
//  SwiftUIView.swift
//  MC3
//
//  Created by Yasna Pourgholamhosseini on 01/03/24.
//

import SwiftUI

struct DescMeditationView: View {
    @State private var offset = CGSize.zero
    var body: some View {
        ZStack{
            
            VStack {
               
                Text("Elevate your serenity with our iPad app's meditation \nfeature—unlock inner peace at the touch of a screen.\nDive into tranquil realms and discover the power of mindfulness\nanytime, anywhere.")
                
                    .font(Font .custom("SF PRO", size: 25) )
                    .gesture(
                        DragGesture()
                            .onChanged{ gesture in
                                self.offset = gesture.translation }
                            .onEnded{ _ in
                                withAnimation{
                                    self.offset = .zero
                                    
                                }
                            }
                    )
                Spacer()
            }
            
            Spacer(minLength: 100)
            
            Circle()
                .frame(width: 200 ,height: 200)
                .foregroundColor(.black)
        }
    }
    
}
#Preview {
    DescMeditationView()
}
