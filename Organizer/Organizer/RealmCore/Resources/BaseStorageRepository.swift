//
//  BaseStorageRepository.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 15/04/22.
//

import Foundation
import RealmSwift

public class BaseStorageRepository {
    
    public let configuration: Realm.Configuration
    
    public var realm: Realm {
        do {
            return try Realm(configuration: self.configuration)
        } catch let err {
            fatalError(err.localizedDescription)
        }
    }
    
    public init(configuration: Realm.Configuration = Realm.Configuration.defaultConfiguration) {
        var configuration = configuration
        configuration.deleteRealmIfMigrationNeeded = true
        self.configuration = configuration
    }    
}
