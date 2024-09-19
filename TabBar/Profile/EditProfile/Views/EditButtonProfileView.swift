import SwiftUI

enum SelectedView {
    case edit, preview, none
}

struct EditButtonProfileView: View {
    @State private var selectedView: SelectedView = .edit
    let user: User

    var body: some View {
        VStack {
            SelectorView(selectedView: $selectedView)
            if selectedView == .edit {
                EditProfileView(user:  .constant(user))
            } else if selectedView == .preview {
                NewEditView(user: user) // Assuming you have a preview view
            }
        }
    }
}

struct SelectorView: View {
    @Binding var selectedView: SelectedView

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                Button("Edit") {
                    selectedView = .edit
                }
                .foregroundColor(selectedView == .edit ? .red : .gray)
                .font(.title.bold())
                .frame(width: geometry.size.width / 2)

                Divider()

                Button("Preview") {
                    selectedView = .preview
                }
                .foregroundColor(selectedView == .preview ? .red : .gray)
                .font(.title.bold())
                .frame(width: geometry.size.width / 2)
            }
        }
        .frame(height: 50)
    }
}

// Preview
struct EditButtonProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditButtonProfileView(user: DeveloperPreview.shared.user)
    }
}
