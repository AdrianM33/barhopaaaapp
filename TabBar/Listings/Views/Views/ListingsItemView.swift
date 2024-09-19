import SwiftUI

struct CustommRoundedRectangle: Shape {
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

struct ListingsItemView: View {
    let listings: Listing
    
    var body: some View {
        HStack(spacing: 0) {
            // Use a ZStack to overlay the image with the rounded rectangle shape
            ZStack {
                Image("GSH22")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 190, height: 200)
                    .clipShape(CustommRoundedRectangle(corners: [.topLeft, .bottomLeft]))
                
                // Add overlay if needed
                // For example, you can add a semi-transparent background
                
            }

            VStack(spacing: 2) {
                Text("\(listings.Title)")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .font(.headline)

                Text("\(listings.city),\(listings.state)")
                    .font(.footnote)
                    .fontWeight(.semibold)
                    .foregroundColor(.black)
                

                Spacer()

                HStack(spacing: 6) {
                                    ForEach(0..<5) { index in
                                Image(systemName: "star.fill")
                                    .foregroundColor(index < 3 ? .red : .black)                    }
                }
                Spacer()
                
                HStack {
                    Spacer()
                    Image(systemName: "flame.fill")
                    Text("\(listings.happyHour)")
                        .fontWeight(.medium)
                        .foregroundColor(.black)
                    
                    

                    Spacer()
                }

                Spacer()

                HStack(spacing: 4) {
                    Image("male")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                        .foregroundColor(.black)
                        
                    
                    Text("+8 Friends")
                        .font(.subheadline)
                        .foregroundColor(.black)
                    
                    
                    Image(systemName: "person.fill")
                        .foregroundColor(.black)

                    Text("\(listings.userAttendance)")
                        .foregroundColor(.black)
                        .fontWeight(.medium)
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .padding(8)
            .background(Color.white)
            .clipShape(CustommRoundedRectangle(corners: [.topRight, .bottomRight]))
        }
        .frame(height: 200)
        .padding(8)
    }
}

#if DEBUG
struct ListingsItemView_Previews: PreviewProvider {
    static var previews: some View {
        ListingsItemView(listings: DeveloperPreview.shared.listings[0])
            .background(Color.gray)
    }
}
#endif

