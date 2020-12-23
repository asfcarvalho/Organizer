//
//  HomeDataModule.swift
//  Organizer
//
//  Created by Anderson Carvalho on 14/12/20.
//

import Foundation
import CoreData

class HomeDataModule: BaseDataModel, HomeDataModuleInputProtocol {
    weak var presenter: HomeDataModuleOutputProtocol?
    
    func getBoxList() {
        let context = persistentContainer.viewContext
        
        let fetchRequest = BoxDM.fetchRequest() as NSFetchRequest<BoxDM>
        do {
            let box = try context.fetch(fetchRequest)
            presenter?.onSuccess(box)
        } catch {
            presenter?.onError(error.localizedDescription)
        }
    }
}
