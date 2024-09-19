import SwiftUI

struct NotificationsView: View {
    @State private var overallNotificationsEnabled: Bool = UserDefaults.standard.bool(forKey: "overallNotificationsEnabled") {
        didSet {
            if overallNotificationsEnabled {
                
                newBarsClubsEnabled = true
                upcomingEventsEnabled = true
                newEventsEnabled = true
                friendsPostingPhotoEnabled = true
                personalizedRecommendationsEnabled = true
            } else {
                
                newBarsClubsEnabled = false
                upcomingEventsEnabled = false
                newEventsEnabled = false
                friendsPostingPhotoEnabled = false
                personalizedRecommendationsEnabled = false
            }
            saveSettings()
        }
    }
    @State private var newBarsClubsEnabled: Bool = UserDefaults.standard.bool(forKey: "newBarsClubsEnabled")
    @State private var upcomingEventsEnabled: Bool = UserDefaults.standard.bool(forKey: "upcomingEventsEnabled")
    @State private var newEventsEnabled: Bool = UserDefaults.standard.bool(forKey: "newEventsEnabled")
    @State private var friendsPostingPhotoEnabled: Bool = UserDefaults.standard.bool(forKey: "friendsPostingPhotoEnabled")
    @State private var personalizedRecommendationsEnabled: Bool = UserDefaults.standard.bool(forKey: "personalizedRecommendationsEnabled")

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            Text("Notifications Settings")
                .font(.largeTitle)
                .padding()

            Toggle(isOn: $overallNotificationsEnabled) {
                Text("Enable All Notifications")
            }
            .padding()
            .onChange(of: overallNotificationsEnabled) { _ in
                // Update all individual notification settings when overall is toggled
                if overallNotificationsEnabled {
                    newBarsClubsEnabled = true
                    upcomingEventsEnabled = true
                    newEventsEnabled = true
                    friendsPostingPhotoEnabled = true
                    personalizedRecommendationsEnabled = true
                }
                saveSettings()
            }

            Toggle(isOn: Binding(
                get: { newBarsClubsEnabled && overallNotificationsEnabled },
                set: { newValue in
                    newBarsClubsEnabled = newValue
                    saveSettings()
                })) {
                Text("New Bars/Clubs Added")
            }
            .padding()
            .disabled(!overallNotificationsEnabled)

            Toggle(isOn: Binding(
                get: { upcomingEventsEnabled && overallNotificationsEnabled },
                set: { newValue in
                    upcomingEventsEnabled = newValue
                    saveSettings()
                })) {
                Text("Upcoming Events")
            }
            .padding()
            .disabled(!overallNotificationsEnabled)

            Toggle(isOn: Binding(
                get: { newEventsEnabled && overallNotificationsEnabled },
                set: { newValue in
                    newEventsEnabled = newValue
                    saveSettings()
                })) {
                Text("New Events")
            }
            .padding()
            .disabled(!overallNotificationsEnabled)

            Toggle(isOn: Binding(
                get: { friendsPostingPhotoEnabled && overallNotificationsEnabled },
                set: { newValue in
                    friendsPostingPhotoEnabled = newValue
                    saveSettings()
                })) {
                Text("Friends Activity")
            }
            .padding()
            .disabled(!overallNotificationsEnabled)

            Toggle(isOn: Binding(
                get: { personalizedRecommendationsEnabled && overallNotificationsEnabled },
                set: { newValue in
                    personalizedRecommendationsEnabled = newValue
                    saveSettings()
                })) {
                Text("New Recommendations")
            }
            .padding()
            .disabled(!overallNotificationsEnabled)

            Spacer()
        }
        .padding()
    }

    private func saveSettings() {
        UserDefaults.standard.set(overallNotificationsEnabled, forKey: "overallNotificationsEnabled")
        UserDefaults.standard.set(newBarsClubsEnabled, forKey: "newBarsClubsEnabled")
        UserDefaults.standard.set(upcomingEventsEnabled, forKey: "upcomingEventsEnabled")
        UserDefaults.standard.set(newEventsEnabled, forKey: "newEventsEnabled")
        UserDefaults.standard.set(friendsPostingPhotoEnabled, forKey: "friendsPostingPhotoEnabled")
        UserDefaults.standard.set(personalizedRecommendationsEnabled, forKey: "personalizedRecommendationsEnabled")
    }
}

struct NotificationsView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationsView()
    }
}


