import SwiftUI

// Assuming the enum definition is available globally or within an appropriate scope
enum SelectedButton {
    case popular, price, nearby, hh, none
}

struct ButtonView: View {
    // State to track the currently selected button
    @State private var selectedButton: SelectedButton = .none
    
    // Callback function to communicate button taps
    var onButtonTap: (SelectedButton) -> Void

    var body: some View {
        HStack {
            // Popular button
            Button(action: {
                self.selectedButton = self.selectedButton == .popular ? .none : .popular
                self.onButtonTap(self.selectedButton)
            }) {
                Text("Popular")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(width: 59, height: 2) // Assuming height was meant to be more than 2 for visibility
                    .padding()
                    .background(selectedButton == .popular ?
                                LinearGradient(gradient: Gradient(colors: [Color.red.opacity(1.0), Color.orange]), startPoint: .top, endPoint: .bottom) :
                                    LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .top, endPoint: .bottom)
                                )
                    .foregroundColor(selectedButton == .popular ? .white : .black)
                    .cornerRadius(14)
                    .shadow(color: Color.black.opacity(selectedButton == .popular ? 0.6 : 0.6), radius: 4, x: 0, y: 3)
            }
            .padding(0)

            // Price button
            Button(action: {
                self.selectedButton = self.selectedButton == .price ? .none : .price
                self.onButtonTap(self.selectedButton)
            }) {
                Text("Rating")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(width: 59, height: 2) // Adjust for visibility
                    .padding()
                    .background(
                        selectedButton == .price ?
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(1.0), Color.orange]), startPoint: .top, endPoint: .bottom) :
                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .top, endPoint: .bottom)
                        )
                    .foregroundColor(selectedButton == .price ? .white : .black)
                    .cornerRadius(14)
                    .shadow(color: Color.black.opacity(selectedButton == .price ? 0.6 : 0.6), radius: 4, x: 0, y: 3)
            }
            .padding(0)
            // Nearby button
            Button(action: {
                            self.selectedButton = self.selectedButton == .nearby ? .none : .nearby
                            self.onButtonTap(self.selectedButton)
                        }) {
                Text("Nearby")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(width: 59, height: 2) // Adjusted height for visibility
                    .padding()
                    .background(
                        selectedButton == .nearby ?
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(1.0), Color.orange]), startPoint: .top, endPoint: .bottom) :
                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .top, endPoint: .bottom)
                        )
                    .foregroundColor(selectedButton == .nearby ? .white : .black)
                    .cornerRadius(14)
                    .shadow(color: Color.black.opacity(selectedButton == .nearby ? 0.6 : 0.6), radius: 4, x: 0, y: 3)
            }
            .padding(0)

            // HH button
            Button(action: {
                self.selectedButton = self.selectedButton == .hh ? .none : .hh
            }) {
                Text("Deals")
                    .font(.callout)
                    .fontWeight(.semibold)
                    .frame(width: 59, height: 2) // Adjusted height for visibility
                    .padding()
                    .background(
                        selectedButton == .hh ?
                        LinearGradient(gradient: Gradient(colors: [Color.red.opacity(1.0), Color.orange]), startPoint: .top, endPoint: .bottom) :
                            LinearGradient(gradient: Gradient(colors: [Color.white, Color.white]), startPoint: .top, endPoint: .bottom)
                        )

                    .foregroundColor(selectedButton == .hh ? .white : .black)
                    .cornerRadius(14)
                    .shadow(color: Color.black.opacity(selectedButton == .hh ? 0.6 : 0.6), radius: 4, x: 0, y: 3)
            }
            .padding(0)
        }
    }
}

struct ButtonView_Previews: PreviewProvider {
    static var previews: some View {
        ButtonView(onButtonTap: { _ in })
    }
}
