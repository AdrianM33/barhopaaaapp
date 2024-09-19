import SwiftUI

struct PhotoView: View {
    // Initialize images with specific asset names
    @State private var images: [Image?] = [
        Image("p1"), // Assuming "GSH" is the name of an image in your assets
        Image("male"), // Assuming "p1" is the name of an image in your assets
        Image("TY") // Assuming "male" is the name of an image in your assets
    ]
    
    var body: some View {
        VStack {
            ZStack {
                CircleView(image: $images[2], borderColor: .black, borderWidth: 2, size: 90)
                    .offset(x: -60, y: 0) // Adjust positioning as needed
                    .zIndex(1) // Ensures this view is at the back
                CircleView(image: $images[1], borderColor: .white, borderWidth: 4, size: 120)
                    .zIndex(2) // Middle circle, so it's on top of the first one and larger
                CircleView(image: $images[0], borderColor: .black, borderWidth: 2, size: 90)
                    .offset(x: 60, y: 0) // Adjust positioning as needed
                    .zIndex(1) // Ensures this view is at the back
            }
            .frame(height: 130) // Adjust the frame to fit your design needs
            
            Button(action: {
                // Action for taking/uploading a photo
                // Placeholder for now, we'll fill this in later
            }) {
                Text("Take Photo")
                    .font(.subheadline)
                    .fontWeight(.black)
                    .foregroundColor(.white)
                    .padding(12)
                    .background(
                        LinearGradient(
                            gradient: Gradient(colors: [.red, .orange]),
                            startPoint: .top,
                            endPoint: .bottom
                        )
                    )

                    .cornerRadius(8)
                    .padding(.bottom,15)
            }
        }
    }
}

struct CircleView: View {
    @Binding var image: Image?
    var borderColor: Color
    var borderWidth: CGFloat
    var size: CGFloat
    
    var body: some View {
        ZStack {
            if let image = image {
                image
                    .resizable()
                    .scaledToFill()
            } else {
                Circle()
                    .fill(Color.gray)
            }
        }
        .frame(width: size, height: size) // Use the size parameter to adjust the circle's size
        .clipShape(Circle()) // Ensure the image is clipped to a circle
        .overlay(Circle().stroke(borderColor, lineWidth: borderWidth)) // Apply border color and width
    }
}

// Preview struct
struct PhotoView_Previews: PreviewProvider {
    static var previews: some View {
        PhotoView()
    }
}
