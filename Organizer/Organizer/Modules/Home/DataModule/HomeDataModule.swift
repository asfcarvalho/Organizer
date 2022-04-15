//
//  HomeDataModule.swift
//  Organizer
//
//  Created by Anderson Carvalho on 14/12/20.
//

import Foundation
import CoreData

class HomeDataModule: HomeDataModuleInputProtocol {
    weak var presenter: HomeDataModuleOutputProtocol?
    
    func getBoxList() {
        guard let box = BaseDataModel.shared.fetchEntities(entity: Box.self) else {
            presenter?.onError("Erro loading box list")
            return
        }
        
        presenter?.onSuccess(box.compactMap({
            BoxModel(titleBox: $0.title ?? "",
                     description: $0.boxDescription,
                     imageName: $0.image,
                     barcode: $0.barcode,
                     boxItems: $0.boxItemList?.compactMap({ item in
                let item = item as? BoxItem
                return BoxItemModel(idBoxItem: Int(item?.id ?? 0),
                                    title: item?.title ?? "",
                                    description: item?.boxItemDescription,
                                    imageName: item?.image)
            }))
        }))
    }
}
