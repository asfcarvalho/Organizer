//
//  BoxStorageRepository.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 15/04/22.
//

import Foundation

public enum AppErrors: Error {
    case defaultError
}

protocol BoxStorageRepositoryProtocol {
    func fetchBox(_ completionBlock: (Result<[BoxModel], AppErrors>) -> Void)
    func createOrUpdateBox(_ schedules: [BoxModel], completionBlock: (Result<Void, AppErrors>) -> Void)
}

public final class BoxStorageRepository: BaseStorageRepository, BoxStorageRepositoryProtocol {
    public func fetchBox(_ completionBlock: (Result<[BoxModel], AppErrors>) -> Void) {
        let realm = self.realm
        let objects = realm.objects(BoxRLM.self).asBoxArray()
        completionBlock(.success(objects))
    }
    
    public func createOrUpdateBox(_ schedules: [BoxModel], completionBlock: (Result<Void, AppErrors>) -> Void) {
        let realm = self.realm
        
        do {
            try realm.write {
                let old = realm.objects(BoxRLM.self)
                realm.delete(old)
                
                let new = schedules.asScheduleRLMArray()
                realm.add(new)
                completionBlock(.success(()))
            }
        } catch {
            completionBlock(.failure(AppErrors.failedToCreateRealmObject(object: "\(ScheduleRLM.description())")))
        }
    }
}
