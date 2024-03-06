//
//  DescFocusView.swift
//  MC3
//
//  Created by Yasna Pourgholamhosseini on 01/03/24.
//

//
//  SwiftUIView.swift
//  MC3
//
//  Created by Yasna Pourgholamhosseini on 01/03/24.
//

import SwiftUI

struct DescFocusView: View {
    var body: some View {
        ZStack{
            
            VStack {
                
                Text("")
                
                    .font(Font .custom("SF PRO", size: 25) )
                
                Spacer()
                
                Text(NSLocalizedString("Set the timer and Stare at the Circle", comment: ""))
                    .font(Font .custom("SF PRO" , size : 50) )
                
                Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
                
                Text(NSLocalizedString("Recommended : Do the practice for 10 minute in a dark place", comment: ""))
                    .font(Font .custom("SF PRO" , size : 25) )
                    
                
            }
        }
        
        Spacer()
        
        
        NavigationStack {
            NavigationLink(destination:
                            FocusColorInCircleView()) {
                
                ZStack{
                    
                    
                    Circle()
                        .fill(.black)
                        .padding()
                        .frame(width: 250, height: 250)
                    Circle()
                        .fill(.white)
                    
                        .frame(width: 150 ,height: 150)
                        .foregroundColor(.black)
                        .opacity(0.8)
                    Text("Start")
                        .foregroundColor(.black)
                        .font(.title)
                }
            }
        }
    }
}
#Preview {
    DescFocusView()
}
