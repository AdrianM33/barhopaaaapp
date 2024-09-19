import SwiftUI

struct GoingView: View {
    
    @EnvironmentObject var viewModel: ListingsViewModel
    @ObservedObject var listing: Listing
    
    // arcopo
    /// need to pas the viewmodel here
    let timer = Timer.publish(every: 60, on: .main, in: .common).autoconnect() // Check every minute

    var body: some View {
        Button(action: {
            withAnimation(.easeInOut(duration: 0.7)) {
                //self.listing.userIsGoing.toggle()
                self.viewModel.toggleUserIsGoing(for: self.listing)
            }
        }) {
            Text("Going")
                .fontWeight(listing.userIsGoing ? .bold : .regular)
                .foregroundColor(listing.userIsGoing ? .white : .red)
                .padding()
                .frame(height: 40)
                .background(backgroundView)
                .cornerRadius(10)
                .scaleEffect(listing.userIsGoing ? 1.0 : 1.0)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(listing.userIsGoing ? Color.white : Color.red, lineWidth: 2)
                )
        }
        .onReceive(timer) { _ in
            checkForReset()
        }
    }

    var backgroundView: some View {
        ZStack {
            Color.white
            if listing.userIsGoing {
                LinearGradient(gradient: Gradient(colors: [Color.red, Color.orange]), startPoint: .topLeading, endPoint: .bottomTrailing)
            }
        }
        .animation(.easeInOut(duration: 0.7), value: listing.userIsGoing)
    }

    private func checkForReset() {
        let now = Date()
        let calendar = Calendar.current
        let hour = calendar.component(.hour, from: now)
        let minute = calendar.component(.minute, from: now)

        // Check if current time is at or past 2 AM and before 2:01 AM (to avoid multiple resets)
        if hour == 2 && minute == 30 {
            withAnimation(.easeInOut(duration: 0.7)) {
                listing.userIsGoing = false
            }
        }
    }
}
