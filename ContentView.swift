import SwiftUI

struct ContentView: View {
    @EnvironmentObject var locationViewModel: LocationViewModel
    @StateObject var viewModel: ContentViewModel
    private let authService: AuthService
    private let userService: UserService
    
    init(authService: AuthService,userService: UserService){
        self.authService = authService
        self.userService = userService
        
        let vm = ContentViewModel(authService: authService, userService: userService)
        
        self._viewModel = StateObject(wrappedValue: vm)
    }
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                if let user = viewModel.currentUser {
                    MainTabBar(authService: authService, user: user)
                        .environmentObject(viewModel)
                        .environmentObject(locationViewModel)
                }
            } else {
                LoginViews(authService: authService)
            }
        }
    }
}

