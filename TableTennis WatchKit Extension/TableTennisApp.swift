//
//  TableTennisApp.swift
//  TableTennis WatchKit Extension
//
//  Created by Ankish Khatri on 28/05/21.
//

import SwiftUI

@main
struct TableTennisApp: App {
    @StateObject var tennisViewModel: TennisViewModel = TennisViewModel()
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
            .environmentObject(tennisViewModel)
        }
        
        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
