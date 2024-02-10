// ShmudokuApp.swift



import SwiftUI
import CoreData

@main
struct ShmudokuApp: App {
    let persistenceController = PersistenceController.shared
    @Environment(\.managedObjectContext) var managedObjectContext
    let userDefaults = UserDefaults.standard

    
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}

