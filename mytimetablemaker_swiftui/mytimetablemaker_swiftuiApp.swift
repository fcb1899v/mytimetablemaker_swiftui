//
//  mytimetablemaker_swiftuiApp.swift
//  mytimetablemaker_swiftui
//
//  Created by 中島正雄 on 2021/04/06.
//

import SwiftUI

@main
struct mytimetablemaker_swiftuiApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
