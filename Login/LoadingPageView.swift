import SwiftUI

struct LoadingPageView: View {
    @State private var gradientPosition = -UIScreen.main.bounds.width
    @State private var isLoadingFinished = false
    
    var body: some View {
        ZStack {
            // Background image
            Image("HHH")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
            
            if isLoadingFinished {
                // Display normal text after loading
                Text("BAR HOPPA")
                    .font(.system(size: 48, weight: .heavy))
                    .foregroundColor(.white)
            } else {
                // Text with animation
                Text("BAR HOPPA")
                    .font(.system(size: 48, weight: .heavy))
                    .foregroundColor(.white)
                    .frame(width: UIScreen.main.bounds.width, height: 100, alignment: .center)
                    .mask(
                        LinearGradient(gradient: Gradient(colors: [Color.clear, Color.black, Color.clear]), startPoint: .leading, endPoint: .trailing)
                            .offset(x: gradientPosition)
                    )
            }
        }
        .onAppear {
            // Start the animation
            withAnimation(.easeInOut(duration: 8)) {
                gradientPosition = UIScreen.main.bounds.width
            }
            // Use DispatchQueue.main.asyncAfter to trigger the state change after the animation duration
            DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
                isLoadingFinished = true
            }
        }
    }
}

struct LoadingPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingPageView()
    }
}
