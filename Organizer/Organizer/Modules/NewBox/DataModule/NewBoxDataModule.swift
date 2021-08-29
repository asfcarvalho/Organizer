//
//  NewBoxDataModule.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 23/12/20.
//

import Foundation
import CoreData

class NewBoxDataModule: NewBoxDataModuleInputProtocol {
    weak var presenter: NewBoxDataModuleOutputProtocol?
    
    var objectType = BoxDM.self
    let coreData = BaseDataModel.shared
    
    func saveOrUpdateBox(_ box: Box?) {
        
        let boxDM = getBox(with: box?.idBox)
        boxDM.id = getNextId()
        boxDM.title = box?.titleBox
        boxDM.boxDescription = box?.description
        boxDM.image = box?.imageName
        boxDM.barcode = box?.barcode
        
        var boxItemList: [BoxItemDM] = []
        removeBoxItemList(box)
        var index = 0
        box?.boxItems?.forEach {
            index += 1
            let boxItem = BoxItemDM(context: coreData.managedContext)
            boxItem.id = Int64(index)
            boxItem.title = $0.titleBoxItem
            boxItem.image = $0.imageName
            boxItem.box = boxDM
            boxItemList.append(boxItem)
        }
        
        coreData.saveContext { [weak self] result in
            switch result {
            case .success:
                self?.presenter?.onSuccess()
            case .failed:
                self?.presenter?.onError("Error")
            }
        }
    }
    
    private func getBox(with id: Int?) -> BoxDM {
        var box = BoxDM(context: coreData.managedContext)
        
        if id == 0 {
            let predicate = NSPredicate(format: "id == %@", id ?? 0)
            let result = coreData.fetchEntities(entity: objectType,
                                                predicate: predicate)
            
            box = result?.first ?? BoxDM(context: coreData.managedContext)
        }
        
        return box
    }
    
    private func removeBoxItemList(_ box: Box?) {
        guard let box = box, box.idBox != 0 else {
            return
        }
        let predicate = NSPredicate(format: "box.id MACHES %@", box.idBox)
        let boxItemList = coreData.fetchEntities(entity: BoxItemDM.self,
                                                 predicate: predicate)
        boxItemList?.forEach({
            let context = $0.managedObjectContext
            context?.delete($0)
        })
    }
    
    private func getNextId() -> Int64 {
        let request = BoxDM.fetchRequest() as NSFetchRequest<BoxDM>
        request.fetchLimit = 1

        let sort = NSSortDescriptor(key: "id", ascending: false)
        request.sortDescriptors = [sort]

        let result = coreData.fetchEntities(entity: objectType)?.last

        return (result?.id ?? 0) + 1
    }
}
