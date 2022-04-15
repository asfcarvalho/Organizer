//
//  Trasform+Box.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 15/04/22.
//

import Foundation

extension BoxRLM {
    func asBox() -> BoxModel {
        BoxModel(titleBox: titleBox,
                 description: descriptionBox,
                 imageName: imageName,
                 barcode: barcode,
                 boxItems: boxItems.asBoxItemArray())
    }
}

internal extension Sequence where Element == BoxRLM {
    func asBoxArray() -> [BoxModel] {
        self.map{ $0.asBox() }
    }
}

extension BoxModel {
    func asBoxRLM() -> BoxRLM {
        BoxRLM.create { box in
            box.
        }
    }
}
