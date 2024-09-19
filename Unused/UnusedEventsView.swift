import SwiftUI

struct UnusedEventsView: View {
    @State private var searchText = ""
    
    var body: some View {
        NavigationView {
            VStack {
                // Top section with "Events" text and search bar
                VStack {
                    Text("Events")
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(Color.white)
                        .padding(.bottom,-2)
                    
                    SearchBarEvents(text: $searchText)
                }
                .frame(maxWidth: .infinity)
                .padding(.horizontal, 10)
                
                // Events this week
                VStack {
                    EventButtonListings()
                       
                }
                .padding(.top, -2.0)
            }
            .background(
                LinearGradient(
                    gradient: Gradient(stops: [
                        .init(color: Color.red, location: 0.0),
                        .init(color: Color.orange, location: 0.126),
                        .init(color: Color.white.opacity(0.15), location: 0.127)
                    ]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}

struct UnusedEventsView_Previews: PreviewProvider {
    static var previews: some View {
        UnusedEventsView()
    }
}
