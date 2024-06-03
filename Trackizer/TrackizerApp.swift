//
//  TrackizerApp.swift
//  Trackizer
//
//  Created by Modamori Oluwayomi on 2024-05-15.
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
struct TrackizerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var navigationManager = NavigationManager()
    @StateObject private var authViewModel = AuthViewModel()
    var body: some Scene {
        WindowGroup {
           ContentView()
//            ProfileDetailsView()
                .preferredColorScheme(.dark)
                .environmentObject(AuthViewModel())
                .environmentObject(navigationManager)
        }
    }
}
