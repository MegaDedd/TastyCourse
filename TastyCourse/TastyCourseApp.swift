//
//  TastyCourseApp.swift
//  TastyCourse
//
//  Created by Константин on 01.06.2023.
//

import SwiftUI

let screen = UIScreen.main.bounds

@main
struct TastyCourseApp: App {
    var body: some Scene {
        WindowGroup {
            AuthView()
        }
    }
}
