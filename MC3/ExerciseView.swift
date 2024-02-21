//
//  ExerciseView.swift
//  MC3
//
//  Created by khadija Ait ElFqih on 19/02/24.
//

import SwiftUI

struct ExerciseView: View {
    
    var color: Color
    
    
    
    var body: some View {
        ZStack {
            Circle()
                .frame(width: 400,height: 400)
                .foregroundColor(color)
        }
        .ignoresSafeArea()
    }
}

#Preview {
    ExerciseView(color: .red)
}
