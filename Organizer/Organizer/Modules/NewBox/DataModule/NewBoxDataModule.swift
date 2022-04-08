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
    
    var objectType = Box.self
    let coreData = BaseDataModel.shared
    
    func saveOrUpdateBox(_ box: BoxModel?) {
        
        let boxDM = getBox(with: box?.id)
        boxDM.id = box?.id
        boxDM.title = box?.titleBox
        boxDM.boxDescription = box?.description
        boxDM.image = box?.imageName
        boxDM.barcode = box?.barcode
        
//        var boxItemList: [BoxItem] = []
//        removeBoxItemList(box)
//        var index = 0
//        box?.boxItemList?.forEach {
//            index += 1
//            let boxItem = BoxItem(context: coreData.managedContext)
//            boxItem.id = Int64(index)
////            boxItem.title = $0.title
////            boxItem.image = $0.image
//            boxItem.box = boxDM
//            boxItemList.append(boxItem)
//        }
        
        coreData.saveContext { [weak self] result in
            switch result {
            case .success:
                self?.presenter?.onSuccess()
            case .failed:
                self?.presenter?.onError("Error")
            }
        }
    }
    
    private func getBox(with id: String?) -> Box {
        var box = Box(context: coreData.managedContext)
        
        if !(id?.isEmpty ?? true) {
            let predicate = NSPredicate(format: "id == %@", id ?? 0)
            let result = coreData.fetchEntities(entity: objectType,
                                                predicate: predicate)
            
            box = result?.first ?? Box(context: coreData.managedContext)
        }
        
        return box
    }
    
    private func removeBoxItemList(_ box: Box?) {
        guard let box = box, let id = box.id else {
            return
        }
        let predicate = NSPredicate(format: "box.id MACHES %@", id)
        let boxItemList = coreData.fetchEntities(entity: BoxItem.self,
                                                 predicate: predicate)
        boxItemList?.forEach({
            let context = $0.managedObjectContext
            context?.delete($0)
        })
    }
}
