//
//  NewBoxDataModule.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 23/12/20.
//

import Foundation
import CoreData

class NewBoxDataModule: BaseDataModel, NewBoxDataModuleInputProtocol {
    weak var presenter: NewBoxDataModuleOutputProtocol?
    
    func saveBox(_ box: Box?) {
        let context = persistentContainer.viewContext
        
        do {
            let boxDM = BoxDM(context: context)
            boxDM.id = getNextId()
            boxDM.title = box?.titleBox
            boxDM.boxDescription = box?.description
            boxDM.image = box?.imageName
            boxDM.barcode = box?.barcode
            
            var boxItemList: [BoxItemDM] = []
            var index = 0
            box?.boxItems?.forEach {
                index += 1
                let boxItem = BoxItemDM(context: context)
                boxItem.id = Int64(index)
                boxItem.title = $0.titleBoxItem
                boxItem.image = $0.imageName
                boxItem.box = boxDM
                boxItemList.append(boxItem)
            }
            
            try context.save()
            presenter?.onSuccess()
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
