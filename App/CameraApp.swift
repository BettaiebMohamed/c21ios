import SwiftUI



@main
struct CameraApp: App {
    @State private var isAuthenticated = UserDefaults.standard.bool(forKey: "isAuthenticated")
    @State private var isSplashScreenVisible = true
    
    init() {
        UINavigationBar.applyCustomAppearance()
    }
    
    var body: some Scene {
        WindowGroup {
            if isSplashScreenVisible {
                SplashScreenView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) { // Adjust delay as needed
                            isSplashScreenVisible = false
                        }
                    }
            } else if isAuthenticated {
                CameraView()
            } else {
                PasswordView(isAuthenticated: $isAuthenticated)
                    .onChange(of: isAuthenticated) { newValue in
                        UserDefaults.standard.set(newValue, forKey: "isAuthenticated")
                    }
            }
        }
    }
}

fileprivate extension UINavigationBar {
    static func applyCustomAppearance() {
        let appearance = UINavigationBarAppearance()
        appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
        UINavigationBar.appearance().standardAppearance = appearance
        UINavigationBar.appearance().compactAppearance = appearance
        UINavigationBar.appearance().scrollEdgeAppearance = appearance
    }
}
