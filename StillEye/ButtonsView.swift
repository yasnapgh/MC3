import SwiftUI

struct ButtonsView: View {
    var body: some View {
        NavigationStack{
            ZStack {
                // Use a UIImageView to display the GIF as the background
                ImageView("")
                    .edgesIgnoringSafeArea(.all)
                
                Color.clear // Clear color to allow the GIF to be visible
                
                HStack {
                    Group {
                        NavigationLink(destination: DescMeditationView()) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: 240, height: 65)
                                    .cornerRadius(50)
                                Text(NSLocalizedString("Meditation", comment: ""))
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }
                        .padding(.leading, 10.0)
                        
                        NavigationLink(destination: DescRelaxView()) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: 240, height: 65)
                                    .cornerRadius(50)
                                Text(NSLocalizedString("Relax", comment: ""))
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }
                        .padding(.horizontal, 45)
                        
                        NavigationLink(destination: DescFocusView()) {
                            ZStack {
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width: 240, height: 65)
                                    .cornerRadius(50)
                                Text(NSLocalizedString("Focus", comment: ""))
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                            }
                        }
                        .padding(.trailing, 10.0)
                    }
                }
            }
        }
    }
    
    struct ButtonsView_Previews: PreviewProvider {
        static var previews: some View {
            ButtonsView()
        }
    }
    
    // ImageView to display a UIImage in SwiftUI
    struct ImageView: UIViewRepresentable {
        let imageName: String
        
        init(_ imageName: String) {
            self.imageName = imageName
        }
        
        func makeUIView(context: Context) -> UIImageView {
            let imageView = UIImageView()
            
            if let gifImage = UIImage(named: imageName) {
                imageView.image = gifImage
                imageView.contentMode = .scaleAspectFill
            }
            
            return imageView
        }
        
        func updateUIView(_ uiView: UIImageView, context: Context) {
            // Update view
        }
    }
}
