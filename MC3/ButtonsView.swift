import SwiftUI

struct ButtonsView: View {
    var body: some View {
        ZStack {
            Color(.white) // Background color
            
            
            HStack {
                Group {
                    
                    NavigationLink {
                        MeditationColorInCircleView()
                    } label: {
                        //  ButtonLikeView("Meditation")
                        ZStack{
                            Rectangle()
                                .foregroundColor(.black)
                                .frame(width:240 ,height: 65)
                                .cornerRadius(50)
                            Text (" Meditation ")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .bold()
                            
                        }
                    }
                    .padding(.leading, 10.0)
                    
                    
                        NavigationLink {
                            RelaxColorInCircleView()
                        } label: {
                           // ButtonLikeView("Relax")
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width:240 ,height: 65)
                                    .cornerRadius(50)
                                Text (" Relax ")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                    .bold()
                            }
                            
                        }
                        
                        .padding(.horizontal,45)

                        NavigationLink {
                            FocusColorInCircleView()
                        } label: {
                             //ButtonLikeView("Focus")
                            ZStack{
                                Rectangle()
                                    .foregroundColor(.black)
                                    .frame(width:240 ,height: 65)
                                    .cornerRadius(50)
                                Text (" Focus ")
                                    .foregroundColor(.white)
                                    .font(.largeTitle)
                                
                            }
                            
                        }
                        .padding(.trailing, 10.0)

                    }
                    
                }
            }
            
        }
    }



#Preview {
    ButtonsView()
}
