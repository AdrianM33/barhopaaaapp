//
//  NewEditView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 12/4/2024.
//

import SwiftUI

struct NewEditView: View{
    let user: User
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack{
            ScrollView{
                CurrentUserPreviewView(user: user)
                Divider()
                ProfileGridView()
            }
            .scrollIndicators(.hidden)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button("Cancel") {
                        dismiss()
                    }
                    .font(.headline.bold())
                }
                
            }
            .navigationBarTitleDisplayMode(.inline)
            
        }
    }
}

struct NewEditView_Previews: PreviewProvider {
    static var previews: some View {
        NewEditView(user: DeveloperPreview.shared.user)
    }
}

