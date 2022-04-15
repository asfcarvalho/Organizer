//
//  Trasform+BoxItem.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 15/04/22.
//

import Foundation

extension BoxItemRLM {
    func asBoxItem() -> BoxItemModel {
        BoxItemModel(idBoxItem: idBoxItem,
                     title: titleBoxItem,
                     description: descriptionItem,
                     imageName: imageName)
    }
}

internal extension Sequence where Element == BoxItemRLM {
    func asBoxItemArray() -> [BoxItemModel] {
        self.map{ $0.asBoxItem() }
    }
}
