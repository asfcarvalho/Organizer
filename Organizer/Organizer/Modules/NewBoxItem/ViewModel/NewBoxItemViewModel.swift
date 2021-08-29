//
//  NewBoxItemViewModel.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import SwiftUI

class NewBoxItemViewModel: ObservableObject {
    @Published var boxItem: BoxItem?
    @Published var buttonEnabled: Bool?
    
    init(_ boxItem: BoxItem? = nil) {
        self.boxItem = boxItem
    }
    
    convenience init(_ title: String, _ description: String, _ imageName: String) {
        let boxItem = BoxItem()
        boxItem.id = 0
        boxItem.title = title
        boxItem.boxItemDescription = description
        boxItem.image = imageName
        self.init(boxItem)
    }
}
