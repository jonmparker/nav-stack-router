//
//  NavigationDemoApp.swift
//  NavigationDemo
//
//  Created by Karen on 9/20/23.
//

import SwiftUI

@main
struct NavigationDemoApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
