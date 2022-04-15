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
        if let boxItems = box?.boxItems {
            boxDM.boxItemList = .init(array: boxItems.map({
                let item = BoxItem(context: coreData.managedContext)
                item.id = Int64($0.idBoxItem)
                item.title = $0.titleBoxItem
                item.boxItemDescription = $0.description
                item.image = $0.imageName
                
                return item
            }))
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
    
    private func removeBoxItemList(_ box: BoxModel?) {
        guard let box = box else {
            return
        }
        let predicate = NSPredicate(format: "box.id MACHES %@", box.id)
        let boxItemList = coreData.fetchEntities(entity: BoxItem.self,
                                                 predicate: predicate)
        boxItemList?.forEach({
            let context = $0.managedObjectContext
            context?.delete($0)
        })
    }
}
