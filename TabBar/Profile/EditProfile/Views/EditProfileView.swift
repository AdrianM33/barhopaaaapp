import SwiftUI
import PhotosUI

struct EditProfileView: View {
    @Binding var user: User
    
    @State private var selectedPickerItem: PhotosPickerItem?
    @State private var profileImage: Image?
    @State private var uiImage: UIImage?

    @StateObject var manager = EditProfileManager(imageUploader: ImageUploader())
    @Environment(\.dismiss) private var dismiss
    
    init(user: Binding<User>) {
        self._user = user
    }

    var body: some View {
        NavigationStack {
            VStack {
                profileImageView
                profileOptionsView
                Spacer()
            }
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.headline.bold())
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button("Save") {
                        onDoneTapped()
                    }
                    .font(.headline.bold())
                }
            }
            .onChange(of: selectedPickerItem) { _ in
                Task {
                    await loadImage(fromItem: selectedPickerItem)
                }
            }
        }
    }

    private var profileImageView: some View {
        PhotosPicker(selection: $selectedPickerItem, matching: .images) {
            VStack {
                if let image = profileImage {
                    image.resizable()
                         .scaledToFill()
                         .frame(width: 130, height: 130)
                         .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle.fill")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 130, height: 130)
                        .clipShape(Circle())
                        .foregroundColor(Color(.systemGray4))
                }
                Text("Change Photo")
                    .font(.title3)
                    .fontWeight(.bold)
                    .foregroundColor(.black)
            }
        }
        .padding()
    }

    private var profileOptionsView: some View {
        VStack(alignment: .leading, spacing: 24) {
            Text("About You")
                .font(.callout)
                .foregroundColor(Color(.systemGray2))
                .fontWeight(.semibold)
            Divider()
            navigationOptionRow(title: "Name", value: user.fullname, destination: EditProfileDetailView(option: .name, user: user))
            Divider()
            navigationOptionRow(title: "Username", value: user.username, destination: EditProfileDetailView(option: .username, user: user))
            Divider()
        }
        .padding()
    }

    private func navigationOptionRow(title: String, value: String, destination: EditProfileDetailView) -> some View {
        NavigationLink(destination: destination) {
            HStack {
                Text(title)
                    .bold()
                    .foregroundColor(.black)
                Spacer()
                Text(value)
                    .foregroundColor(.gray)
            }
        }
    }

    private func loadImage(fromItem item: PhotosPickerItem?) async {
        guard let item = item else { return }
        
        guard let data = try? await item.loadTransferable(type: Data.self) else { return }
        guard let uiImage = UIImage(data: data) else { return }
        self.uiImage = uiImage
        self.profileImage = Image(uiImage: uiImage)
    
    }

    private func onDoneTapped() {
        Task {
            guard let uiImage else { return }
            await manager.uploadProfileImage(uiImage)
                dismiss()
            
        }
    }
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView(user: .constant(DeveloperPreview.shared.user))
    }
}
