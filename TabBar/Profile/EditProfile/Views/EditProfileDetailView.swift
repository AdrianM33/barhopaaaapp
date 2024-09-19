//
//  EditProfileDetailView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 13/4/2024.
//
import SwiftUI

struct EditProfileDetailView: View {
    @Environment(\.dismiss) var dismiss
@State private var value = ""
    
    let option: EditProfileOptions
    let user: User
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                TextField("Add Name", text:$value)
                Spacer()
                
                if !value.isEmpty{
                    Button {
                        value = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundStyle(.black)
                    }
                }
            }
            Divider()
            
            Text(subtitle)
                .font(.footnote)
                .foregroundStyle(.gray)
                .padding(.top,8)
            
            Spacer()
        }
        .padding()
        .navigationTitle(option.title)
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden()
        .onAppear{onViewAppear()}
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .navigationBarTrailing) {
                Button("Save") {
                    dismiss()
                }
                .fontWeight(.semibold) // Apply font weight inside the button closure
            }
        }
    }
}

private extension EditProfileDetailView{
    var subtitle: String {
        switch option{
        case .username:
            return "Usernames can only be changed once, and can contain only letters,numbers, underscores and periods."
        case .name:
            return "Your full name can only be changed once every 7 days"
        }
    }
    func onViewAppear(){
        switch option {
        case .name:
            value = user.fullname
        case .username:
            value = user.username
        }
    }
}


// Preview Provider for SwiftUI Canvas
struct EditProfileDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack{
            EditProfileDetailView(option: .username, user: DeveloperPreview.shared.user)
                .tint(.primary)
        }
    }
}
