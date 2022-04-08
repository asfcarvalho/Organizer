//
//  NewBoxItemViewModel.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import SwiftUI

class NewBoxItemViewModel: ObservableObject {
    @Published var boxItem: BoxItemModel?
    @Published var buttonEnabled: Bool?
    
    init(_ boxItem: BoxItemModel? = nil) {
        self.boxItem = boxItem
    }
    
    convenience init(_ title: String, _ description: String, _ imageName: String) {
        let boxItem = BoxItemModel(idBoxItem: 0,
                                   title: title,
                                   description: description,
                                   imageName: imageName)
        self.init(boxItem)
    }
}
