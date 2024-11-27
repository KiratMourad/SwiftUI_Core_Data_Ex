//
//  DataManager.swift
//  CoreDataExampleApp
//
//  Created by Mourad KIRAT on 18/02/2024.
//

import Foundation
import CoreData
class DataManager: NSObject, ObservableObject {
    
    // Add the Core Data container with the model name
    let container: NSPersistentContainer = NSPersistentContainer(name: "Person")
    
    // Default init method. Load the Core Data container
    override init() {
        super.init()
        container.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Failed to load Core Data stack: \(error)")
            }
        }
    }
}
