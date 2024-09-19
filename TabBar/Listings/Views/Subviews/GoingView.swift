import SwiftUI

struct GoingView: View {
    
    @State var isPressed: Bool
    
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect() // Check every minute

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.7)) {
                self.isPressed.toggle()
            }
        }) {
            Text("Going")
                .fontWeight(isPressed ? .bold : .regular)
                .foregroundColor(isPressed ? .white : .red)
                .padding()
                .frame(height: 40)
                .background(backgroundView)
                .cornerRadius(10)
                .scaleEffect(isPressed ? 1.0 : 1.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isPressed ? Color.white : Color.red, lineWidth: 2)
                )
        }
        .onReceive(timer) { _ in
            checkForReset()
        }
    }

    var backgroundView: some View {
        ZStack {
            Color.white
            if isPressed {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
        .animation(.easeInOut(duration: 0.7), value: isPressed)
    }

    private func checkForReset() {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        let minute = calendar.component(.minute, from: now)

        // Check if current time is at or past 2 AM and before 2:01 AM (to avoid multiple resets)
        if hour == 2 && minute == 30 {
            withAnimation(.easeInOut(duration: 0.7)) {
                isPressed = false
            }
        }
    }
}
