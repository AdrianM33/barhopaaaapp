import SwiftUI

enum AgeConfirmationStatus {
    case undecided, over18, under18
}

struct AgeConfirmationView: View {
    @State private var ageStatus: AgeConfirmationStatus = .undecided
    var onContinue: () -> Void
    
    var body: some View {
        ZStack {
            
            VStack(spacing: 20) {
                Text("Please Confirm Your Age")
                    .font(.title3)
                    .foregroundColor(.white)
                    .bold()
                
                Text("I confirm at the time of signing up I am over the age of 18")
                    .font(.headline)
                    .fontWeight(.regular)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                
                HStack(spacing: 20) {
                    CircleButton(isSelected: ageStatus == .over18) {
                        ageStatus = .over18
                    }
                    Text("I am over 18")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                
                HStack(spacing: 27) {
                    CircleButton(isSelected: ageStatus == .under18) {
                        ageStatus = .under18
                    }
                    Text("I am not 18")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                
                // Inside AgeConfirmationView
                Button(action: {
                    if ageStatus == .over18 {
                        onContinue() // This moves the UI to the Account Detail view.
                    }
                }) {
                    Text(ageStatus == .over18 ? "Continue" : "Must be 18+")
                        .font(.title2)
                        .fontWeight(.semibold)
                        .foregroundColor(.black)
                        .frame(width: 200, height: 50)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .fill(Color.white)
                        )
                }
                .disabled(ageStatus != .over18)
                .opacity(ageStatus == .over18 ? 1 : 0.5)

            }
            .padding()
        }
       
    }
}

struct CircleButton: View {
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(isSelected ? Color.white : Color.clear) // Fill when selected
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 2) // Always show white outline
                )
                .animation(.easeInOut, value: isSelected)
        }
    }
}


