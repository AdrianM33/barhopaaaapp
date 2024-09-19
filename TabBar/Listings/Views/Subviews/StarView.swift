import SwiftUI

struct StarView: View {
    @State private var rating: Int? // This will now be initialized based on the Listing's rating
    @State private var totalRatingsSum: Double
    @State private var numberOfRatings: Double

    var listing: Listing // Accept a Listing object

    private var averageRating: Double {
        numberOfRatings == 0 ? 0 : totalRatingsSum / numberOfRatings
    }

    init(listing: Listing) {
        self.listing = listing
        _rating = State(initialValue: Int(listing.rating))
        _totalRatingsSum = State(initialValue: listing.rating)
        _numberOfRatings = State(initialValue: 1) // Assuming each listing starts with a single rating
    }

    var body: some View {
        VStack {
            HStack {
                ForEach(1...5, id: \.self) { star in
                                    Image(systemName: "star.fill")
                                        .foregroundColor(self.rating != nil && star <= self.rating! ? .clear : .black) // Apply clear for gradient and black for non-selected
                                        .background(
                                            self.rating != nil && star <= self.rating! ? LinearGradient(gradient: Gradient(colors: [.red, .orange]), startPoint: .top, endPoint: .bottom) : LinearGradient(gradient: Gradient(colors: [.black, .black]), startPoint: .top, endPoint: .bottom)
                                        )
                                        .mask(
                                            Image(systemName: "star.fill")
                                                .resizable()
                                                .scaledToFit()
                                        )
                        .onTapGesture {
                            withAnimation(.easeInOut) {
                                updateRating(to: star)
                            }
                        }
                        .scaleEffect(self.rating != nil && star <= self.rating! ? 1.25 : 1)
                        .animation(.easeInOut(duration: 0.2), value: rating)
                }
                // Display the average rating
                Text(String(format: "%.1f", averageRating))
                    .padding(.leading, 10)
            }
            .padding()
        }
    }

    func updateRating(to newRating: Int) {
        self.rating = newRating
        // Add logic to update totalRatingsSum and numberOfRatings
        // For demonstration, simply adding the new rating to the sum and incrementing the count
        // In a real app, you might fetch and recalculate these values based on persistent data
        totalRatingsSum += Double(newRating)
        numberOfRatings += 1
        submitReview()
    }

    func submitReview() {
        // Implement submission logic here
        // This could involve saving the rating to your model or server and recalculating the average rating
    }
}

struct StarView_Previews: PreviewProvider {
    static var previews: some View {
         
        StarView(listing: DeveloperPreview.shared.listings[0])
    }
}
