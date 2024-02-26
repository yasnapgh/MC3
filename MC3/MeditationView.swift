import SwiftUI
import UserNotifications

struct AnimatedCircle: View {
    @State private var colorIndex = 0
    private let colors: [Color] = [
        Color(red: 1, green: 1, blue: 0), // Yellow
        Color(red: 1, green: 0.75, blue: 0), // Orange
        Color(red: 1, green: 0.5, blue: 0), // Dark orange
        Color(red: 1, green: 0.25, blue: 0), // Red-orange
        Color(red: 1, green: 0, blue: 0) // Red
    ]
    private let transitionDuration = 60.0 // Duration for color transition in seconds
    private let stayRedDuration = 20.0 // Duration for staying red in seconds
    private let stayDarkOrangeDuration = 20.0 // Duration for staying dark orange in seconds
    @State private var totalDuration: TimeInterval = 0 // Total duration for repeating in seconds
    
    var body: some View {
        ZStack {
            Color.black.edgesIgnoringSafeArea(.all) // Dark background
            Circle()
                .fill(colors[colorIndex])
                .frame(width: 400, height: 400)
                .onAppear {
                    // Prompt user for total duration
                    askForTotalDuration()
                }
        }
    }
    
    private func askForTotalDuration() {
        // Create an alert with a TextField for user input
        let alert = UIAlertController(title: "How long do you want to meditate(recommended 15 min)", message: nil, preferredStyle: .alert)
        alert.addTextField { textField in
            textField.placeholder = "Duration in minutes"
            textField.keyboardType = .numberPad
        }
        alert.addAction(UIAlertAction(title: "OK", style: .default) { _ in
            // Retrieve user input and start color transition animation
            if let durationString = alert.textFields?.first?.text,
               let minutes = Double(durationString) {
                self.totalDuration = minutes * 60 // Convert minutes to seconds
                startColorTransition()
            }
        })
        UIApplication.shared.windows.first?.rootViewController?.present(alert, animated: true, completion: nil)
    }
    
    private func startColorTransition() {
        // Animate color transition
        withAnimation(Animation.linear(duration: transitionDuration).repeatForever(autoreverses: true)) {
            self.colorIndex = self.colors.count - 1
        }
        // Delay for staying dark orange
        DispatchQueue.main.asyncAfter(deadline: .now() + transitionDuration - stayDarkOrangeDuration - stayRedDuration) {
            // Change color index to dark orange
            self.colorIndex = 2
        }
        // Delay for staying red
        DispatchQueue.main.asyncAfter(deadline: .now() + transitionDuration - stayRedDuration) {
            // Change color index to stay red
            self.colorIndex = self.colors.count - 1
        }
        // Schedule notification when duration ends
        DispatchQueue.main.asyncAfter(deadline: .now() + totalDuration) {
            scheduleNotification()
        }
    }
    
    private func scheduleNotification() {
        let content = UNMutableNotificationContent()
        content.title = "Timer Ended"
        content.body = "The timer you set has ended."
        
        let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 1, repeats: false)
        let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
        UNUserNotificationCenter.current().add(request) { error in
            if let error = error {
                print("Error scheduling notification: \(error)")
            } else {
                print("Notification scheduled successfully.")
            }
        }
    }
}

struct MeditationView: View {
    var body: some View {
        AnimatedCircle()
    }
}

struct MeditationView_Previews: PreviewProvider {
    static var previews: some View {
        MeditationView()
    }
}
