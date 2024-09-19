import SwiftUI
import Kingfisher

struct AvatarView: View {
    let user: User?

    var body: some View {
        Group {
            if let imageUrl = user?.profileImageUrl, let url = URL(string: imageUrl) {
                KFImage(url)
                    .resizable()
                    .scaledToFill()
            } else {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .foregroundColor(.gray)  // Use .gray for default color or systemGray4 for more specific
            }
        }
        .frame(width: 130, height: 130)
        .clipShape(Circle())
    }
}

//Preview
struct AvatarView_Previews: PreviewProvider {
    static var previews: some View {
        AvatarView(user: DeveloperPreview.shared.user)
    }
}
