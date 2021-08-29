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
    
    init(_ boxItem: BoxItem) {
        self.boxItem = boxItem
    }
    
    convenience init() {
        self.init(BoxItem(idBoxItem: 0, titleBoxItem: "", description: "", imageName: nil))
    }
    
    convenience init(_ title: String, _ description: String, _ imageName: String) {
        let boxItem = BoxItem(idBoxItem: 0, titleBoxItem: title, description: description, imageName: imageName)
        self.init(boxItem)
    }
}
