//
//  LaunchListApp.swift
//  Shared
//
//  Created by Bradford Holcombe on 12/25/20.
//

import SwiftUI

@main
struct LaunchListApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
