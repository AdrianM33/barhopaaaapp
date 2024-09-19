import SwiftUI

struct SearchBar: View {
    @Binding var text: String
    @State private var isExpanded = false

    var body: some View {
        HStack {
            // Expanded search field
            if isExpanded {
                TextField("Search", text: $text)
                    .foregroundColor(.white) // Text color
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(red: 0.173, green: 0.173, blue: 0.173, opacity: 1)) // Custom gray background
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.white) // Icon color
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                                .onTapGesture {
                                    // Collapse only if there is no text
                                    if text.isEmpty {
                                        withAnimation {
                                            isExpanded = false
                                        }
                                    }
                                }
                            
                            if !text.isEmpty {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.white) // Icon color
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
                    .transition(.scale)
            } else {
                // Collapsed search icon
                Image(systemName: "magnifyingglass")
                    .padding()
                    .background(Circle().fill(Color(red: 0.173, green: 0.173, blue: 0.173, opacity: 1))) // Custom gray background for the circle
                    .foregroundColor(.white) // Icon color
                    .onTapGesture {
                        withAnimation {
                            self.isExpanded = true
                        }
                    }
            }
        }
        .frame(maxWidth: isExpanded ? .infinity : 50, maxHeight: 50)
        .cornerRadius(isExpanded ? 8 : 25)
        .padding(.horizontal)
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
            .preferredColorScheme(.dark) // Use .dark to preview in dark mode if needed
    }
}
