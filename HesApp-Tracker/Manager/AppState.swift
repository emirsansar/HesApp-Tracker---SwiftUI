import Foundation

class AppState: ObservableObject {
    
    /// When the app is first opened, it's set to false to fetch services from Firestore. Later, it becomes true and services are fetched from SwiftData.
    /// The purpose is to add new services to SwiftData if there are any when the app starts.
    @Published var areServicesLoaded = false
    
    /// Used to show the login screen depending on whether the user is logged in or not.
    @Published var isUserLoggedIn: Bool {
        didSet {
            UserDefaults.standard.set(isUserLoggedIn, forKey: "isUserLoggedIn")
        }
    }
    
    init() {
        self.isUserLoggedIn = UserDefaults.standard.bool(forKey: "isUserLoggedIn")
    }
    
    
    func updateLoginStatus(isLogged: Bool) {
        self.isUserLoggedIn = isLogged
    }
    
}
