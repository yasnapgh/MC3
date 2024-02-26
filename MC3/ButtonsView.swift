import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ZStack {
            Color(hex: "BCCBFD").ignoresSafeArea() // Background color
            VStack {
                VStack {
                    Text("Dig into the practice that works for you ")
                        .font(Font.custom("SF Pro", size: 37).weight(.semibold))
                        .fontWeight(.bold)
                        .foregroundColor(.black )
                        .padding()
                
                    
                    Text("")
                        .font(Font.custom("SF Pro", size: 37).weight(.bold))
                        .padding()
                }
           
                HStack {
                    Group {
                        NavigationLink {
                            MeditationView()
                        } label: {
                            ButtonLikeView("Meditation", icon: "figure.yoga").font(.title)
                        }
                        NavigationLink {
                            RelaxView()
                        } label: {
                            ButtonLikeView("Relax", icon: "bed.double")
                        }
                        NavigationLink {
                            FocusView()
                        } label: {
                            ButtonLikeView("Focus", icon: "circle.dotted.circle")
                        }
                    }
                }
            }
            .padding( )
        }
    }
}

extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        var rgb: UInt64 = 0
        scanner.scanHexInt64(&rgb)
        self.init(
            red: Double((rgb & 0xFF0000) >> 16) / 255.0,
            green: Double((rgb & 0x00FF00) >> 8) / 255.0,
            blue: Double(rgb & 0x0000FF) / 255.0
        )
    }
}

#Preview {
    ButtonsView()
}
