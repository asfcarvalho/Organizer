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
        
        presenter?.onSuccess(box.map({
            BoxModel(titleBox: $0.title ?? "",
                     description: $0.boxDescription,
                     imageName: $0.image,
                     barcode: $0.barcode,
                     boxItems: [])
        }))
    }
}
