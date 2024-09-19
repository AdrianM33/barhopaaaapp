//
//  barhopaaaappApp.swift
//  barhopaaaapp
//
//  Created by Patty Sinicki on 17/2/2024.
//

import SwiftUI

import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct MainApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var locationViewModel = LocationViewModel()
    private let authService = AuthService()
    private let userService = UserService()
    
    var body: some Scene {
        WindowGroup {
           ContentView(authService: authService, userService: userService)
                .environmentObject(locationViewModel)
        }
    }
}
    
