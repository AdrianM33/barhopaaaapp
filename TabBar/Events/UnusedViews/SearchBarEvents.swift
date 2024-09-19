import SwiftUI

struct SearchBarEvents: View {
    @Binding var text: String
    
    var body: some View {
        HStack {
            
                
                TextField("Search", text: $text)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.white))
                    .cornerRadius(8)
                    .overlay(
                        HStack {
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                                .padding(.leading, 8)
                            
                            if !text.isEmpty {
                                Button(action: {
                                    self.text = ""
                                }) {
                                    Image(systemName: "multiply.circle.fill")
                                        .foregroundColor(.black)
                                        .padding(.trailing, 8)
                                }
                            }
                        }
                    )
                    .padding(.horizontal, 10)
            }
        }
    }


struct SearchBarEvents_Previews: PreviewProvider {
    static var previews: some View {
        SearchBarEvents(text: .constant(""))
    }
}

