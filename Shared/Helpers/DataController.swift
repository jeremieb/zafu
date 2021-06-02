//
//  PersistanceController.swift
//  Zafu (iOS)
//
//  Created by Jeremie Berduck on 31/05/2021.
//

import SwiftUI
import CoreData

class DataController: ObservableObject {
    
    /// Sync with CloudKit
    let container: NSPersistentCloudKitContainer
    
    init(inMemory: Bool = false) {
        container = NSPersistentCloudKitContainer(name: "Zafu")
        
        /// Store this in RAM for Preview purpose
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        
        /// Load the data model Main
        container.loadPersistentStores { storeDescription, error in /// if there is an error, the app cannot work
            if let error = error {
                fatalError("⚠️ Fatal error loading storage: \(error.localizedDescription)")
            }
        }
    }
    
    static var preview: DataController = {
        let dataController = DataController(inMemory: true)
        let viewContext = dataController.container.viewContext
        
        do {
            try dataController.createSampleData()
        } catch {
            fatalError("⚠️ Fatal error creating preview sample data: \(error.localizedDescription)")
        }
        return dataController
    }()
    
    /// Creating mock location data
    func createSampleData() throws {
        let viewContext = container.viewContext
        let session = Sessions(context: viewContext)
        
        let sessionSample = [
            (session.title = "My Session", session.duration = 5, session.icon = "leaf", session.color = "mainPink", session.interval = 0)
        ]
        
        for _ in sessionSample {
            let newSession = Sessions(context: viewContext)
            newSession.id = UUID()
            newSession.title = "My Session"
            newSession.duration = 300
            newSession.icon = "leaf"
            newSession.color = ".mainBlue"
            newSession.interval = 0
            newSession.objectWillChange.send()
        }
        try viewContext.save()
    }
    
    /// Saving
    func save() {
        if container.viewContext.hasChanges { /// Do the save only if there is something changed
            try? container.viewContext.save()
        }
    }
    
    /// Delete
    func delete(_ object: NSManagedObject) {
        container.viewContext.delete(object)
    }
    
    /// Delete all locations (wipe out)
    func deleteAll() {
        let fetchRequest: NSFetchRequest<NSFetchRequestResult> = Sessions.fetchRequest()
        let batchDeleteRequest = NSBatchDeleteRequest(fetchRequest: fetchRequest)
        _ = try? container.viewContext.execute(batchDeleteRequest)
    }
}
