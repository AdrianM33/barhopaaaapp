//
//  ProfileRequestsView.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 12/3/2024.
//

import SwiftUI

struct ProfileRequest: Identifiable {
    var id = UUID()
    var name: String
}

struct ProfileRequestsView: View {
    // Dummy data for demonstration
    @State var requests = [
        ProfileRequest(name: "John Doe"),
        ProfileRequest(name: "Jane Smith"),
        ProfileRequest(name: "Alex Johnson")
    ]
    
    var body: some View {
        List {
            ForEach($requests) { $request in
                HStack {
                    Text(request.name)
                    Spacer()
                    Button("Accept") {
                        acceptRequest(request)
                    }
                    .foregroundColor(.green)
                    Button("Deny") {
                        denyRequest(request)
                    }
                    .foregroundColor(.red)
                }
            }
        }
        .navigationTitle("Profile Requests")
    }
    
    func acceptRequest(_ request: ProfileRequest) {
        // Handle accept logic here
        requests.removeAll { $0.id == request.id }
    }
    
    func denyRequest(_ request: ProfileRequest) {
        // Handle deny logic here
        requests.removeAll { $0.id == request.id }
    }
}


struct ProfileRequestsView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileRequestsView()
    }
}

