//
//  CoreDataExampleAppApp.swift
//  CoreDataExampleApp
//
//  Created by Mourad KIRAT on 18/02/2024.
// ADD core data name.xcdatamodeld
// https://medium.com/@rizal_hilman/swiftui-tutorial-core-data-7df0cfddd965

import SwiftUI

@main
struct CoreDataExampleApp: App {
    @StateObject private var manager: DataManager = DataManager()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(manager)
                .environment(\.managedObjectContext, manager.container.viewContext)
        }
    }
}
