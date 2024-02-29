//
//  ButtonLikeView.swift
//  MC3
//
//  Created by khadija Ait ElFqih on 19/02/24.
//

import SwiftUI

struct ButtonLikeView: View {
    
    var title: String = ""
   
    init(_ title: String = "") {
        self.title = title
       
    }
    
    var body: some View {
        VStack {
            Text(title)
                .font(Font.custom("SF Pro", size: 37).weight(.bold))
            
        }
            .foregroundStyle(.white)
            .fontWeight(.semibold)
            .padding(.vertical, 5)
            .padding(.horizontal, 50)
            .background {
                
            }
            .padding()
            .background(Color(.black))
            .clipShape(RoundedRectangle(cornerRadius: 70))
            
    }
}

#Preview {
    ButtonLikeView("Button")
}
