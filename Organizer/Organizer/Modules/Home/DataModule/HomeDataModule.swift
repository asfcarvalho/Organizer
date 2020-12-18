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
    
    func saveBox(_ box: Box?) {
        let context = persistentContainer.viewContext
        
        do {
            let boxDM = BoxDM(context: context)
            boxDM.id = getNextId()
            boxDM.title = box?.titleBox
            boxDM.boxDescription = box?.description
            boxDM.image = box?.imageName
            boxDM.boxItemList = nil
            
            let items = BoxItemDM
            
            try context.save()
        } catch {
            presenter?.onError(error.localizedDescription)
        }
    }
    
    private func getNextId() -> Int64 {
        let context = persistentContainer.viewContext
        let request = BoxDM.fetchRequest() as NSFetchRequest<BoxDM>
        request.fetchLimit = 1

        let sort = NSSortDescriptor(key: "id", ascending: false)
        request.sortDescriptors = [sort]

        do {
            let result = try context.fetch(request).first

            return (result?.id ?? 0) + 1
        } catch {
            fatalError(error.localizedDescription)
        }
    }
}
