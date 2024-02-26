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

struct meditationView: View {
    var body: some View {
        ExerciseView(color: .red)
    }
}

// Preview code is omitted for brevity
