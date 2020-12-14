//
//  BaseDataModel.swift
//  Organizer
//
//  Created by Anderson Carvalho on 13/12/20.
//

import CoreData

class BaseDataModel {
    
    lazy var persistentContainer: NSPersistentContainer = {
       let container = NSPersistentContainer(name: "Organizer")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                fatalError("Unable to load persisten stores: \(error)")
            }
        }
        return container
    }()
    
    func saveContext() {
        let context = persistentContainer.viewContext
        guard context.hasChanges else { return }
        do {
            try context.save()
        } catch {
            print("Failure to save context: \(error)")
        }
    }
}
