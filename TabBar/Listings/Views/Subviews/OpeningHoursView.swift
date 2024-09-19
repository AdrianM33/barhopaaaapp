import SwiftUI

struct OpeningHoursView: View {
    var listing: Listing

    @State private var showHours = false

    private var todayOpeningHours: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE" // Gets the full name of the day
        let dayName = dateFormatter.string(from: Date()).capitalized
        // Access openingHours through the listing object
        return listing.openingHours.first { $0.day == dayName }?.hours ?? "Closed"
    }

    var body: some View {
        VStack {
            Button(action: {
                withAnimation {
                    showHours.toggle()
                }
            }) {
                HStack {
                    Text("Opening Hours")
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(Color.red)
                    Spacer()
                    Image(systemName: showHours ? "chevron.up" : "chevron.down")
                        .foregroundColor(Color.red)
                }
            }
            .padding(.horizontal)
            .padding(.top)

            Text("Today: \(todayOpeningHours)")
                .fontWeight(.bold)
                .padding(.leading, -180)
                .padding(.bottom, showHours ? 5 : 8)
            
            if showHours {
                VStack {
                    ForEach(listing.openingHours, id: \.self) { openingHour in
                        Text("\(openingHour.day): \(openingHour.hours)")
                            .frame(maxWidth: .infinity)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .transition(.opacity)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
        .padding(.top)
    }
}

struct OpeningHoursView_Previews: PreviewProvider {
    static var previews: some View {
        // Correctly initialize OpeningHoursView with a Listing object
        OpeningHoursView(listing: DeveloperPreview.shared.listings[0])
    }
}
