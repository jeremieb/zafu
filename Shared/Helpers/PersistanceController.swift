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
            (session.title = "My Session", session.duration = 5, session.icon = "leaf", session.color = "mainPink")
        ]
        
        for _ in sessionSample {
            let newSession = Sessions(context: viewContext)
            newSession.id = UUID()
            newSession.title = "My Session"
            newSession.duration = 5
            newSession.icon = "leaf"
            newSession.color = ".mainBlue"
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

struct PersistenceController {
    static let shared = PersistenceController()

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newSession = Sessions(context: viewContext)
            newSession.id = UUID()
            newSession.title = "My Session"
            newSession.duration = 5
            newSession.icon = "leaf"
            newSession.color = ".mainBlue"
        }
        do {
            try viewContext.save()
        } catch {
            // Replace this implementation with code to handle the error appropriately.
            // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "Zafu")
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.

                /*
                Typical reasons for an error here include:
                * The parent directory does not exist, cannot be created, or disallows writing.
                * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                * The device is out of space.
                * The store could not be migrated to the current model version.
                Check the error message to determine what the actual problem was.
                */
                print("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
