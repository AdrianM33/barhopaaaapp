import SwiftUI

struct CustomRoundedRectangle: Shape {
    var corners: UIRectCorner

    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: 10, height: 10)
        )
        return Path(path.cgPath)
    }
}

struct ListingItemmView: View {
    var body: some View {
        HStack(spacing: 0) {
            // Use a ZStack to overlay the image with the rounded rectangle shape
            ZStack {
                Image("GSH")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 200)
                    .clipShape(CustomRoundedRectangle(corners: [.topLeft, .bottomLeft]))
                
                // Add overlay if needed
                // For example, you can add a semi-transparent background
                Color.black.opacity(0)
            }

            VStack(alignment: .leading, spacing: 12) {
                Text("Garden State Hotel")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.headline)
                    .lineLimit(nil)

                Text("Melbourne, VIC 3000")
                    .fontWeight(.semibold)
                    .foregroundColor(.black)

                HStack {
                    Text("8pm - 12am")
                        .fontWeight(.semibold)
                        .foregroundColor(.black)

                    Spacer()
                }

                HStack(spacing: 2) {
                    ForEach(0..<5) { _ in
                        Image(systemName: "star.fill")
                            .foregroundColor(.black)
                    }
                }

                Spacer()

                HStack(spacing: 2) {
                    Image(systemName: "person.fill")
                        .foregroundColor(.black)

                    Text("283")
                        .foregroundColor(.black)
                        .fontWeight(.bold)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(8)
            .background(Color.white)
            .clipShape(CustomRoundedRectangle(corners: [.topRight, .bottomRight]))
        }
        .frame(height: 200)
        .padding(9)
    }
}

#if DEBUG
struct ListingItemmView_Previews: PreviewProvider {
    static var previews: some View {
        ListingItemmView()
            .background(Color.gray)
    }
}
#endif
