//
//  NewBoxViewModel.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 20/12/20.
//

import SwiftUI

class NewBoxViewModel: ObservableObject {
    @Published var box: Box?
    @Published var buttonEnabled: Bool?
    
    init(_ box: Box?) {        
        self.box = box
    }
    
    convenience init() {
        self.init(Box(idBox: 0, titleBox: "", description: nil, imageName: nil, barcode: nil, boxItems: []))
    }
    
    convenience init(_ title: String, _ description: String, _ qrCode: String,
                     _ imageName: String, _ items: [BoxItem]) {
        let box = Box(idBox: 0, titleBox: title, description: description,
                      imageName: imageName, barcode: qrCode, boxItems: items)
        self.init(box)
    }
}
