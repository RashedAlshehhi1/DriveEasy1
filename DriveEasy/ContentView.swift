import SwiftUI

struct ContentView: View {
    // These states control where the user is in the app
    @State private var isSplashFinished = false
    @State private var isLoggedIn = false
    
    var body: some View {
        ZStack {
            if !isSplashFinished {
                // 1. Show Splash Screen first
                SplashScreenView(isSplashFinished: $isSplashFinished)
            } else if !isLoggedIn {
                // 2. Show Login if not logged in
                LoginView(isLoggedIn: $isLoggedIn)
            } else {
                // 3. Show Main App (Map/Catalog) when logged in
                MainTabView()
            }
        }
        .animation(.easeInOut, value: isSplashFinished)
        .animation(.easeInOut, value: isLoggedIn)
    }
}
