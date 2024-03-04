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


// Preview code is omitted for brevity
