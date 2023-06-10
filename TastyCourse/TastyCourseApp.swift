//
//  TastyCourseApp.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI
import FirebaseCore
import FirebaseAuth




let screen = UIScreen.main.bounds

@main
struct TastyCourseApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) private var delegate // связали класс AppDelegate с TastyCourseApp
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}



class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        print("app delegate отработал")
        return true
    }
}

