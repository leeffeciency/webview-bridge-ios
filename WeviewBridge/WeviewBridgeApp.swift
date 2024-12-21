//
//  WeviewBridgeApp.swift
//  WeviewBridge
//
//  Created by youngchang on 12/21/24.
//

import SwiftUI

@main
struct WeviewBridgeApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
