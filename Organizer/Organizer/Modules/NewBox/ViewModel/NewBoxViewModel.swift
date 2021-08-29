//
//  NewBoxViewModel.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 20/12/20.
//

import SwiftUI
import Combine

class NewBoxViewModel: ObservableObject {
    @Published var box: Box?
    @Published var buttonEnabled: Bool?
    
    private var token = Set<AnyCancellable>()
    let newBoxItemPublisher = PassthroughSubject<BoxItem?, Never>()
    
    init(_ box: Box?) {        
        self.box = box
        configureComunication()
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
    
    private func configureComunication() {
        newBoxItemPublisher.sink { [weak self] boxItem in
            guard var boxItem = boxItem else { return }
            if boxItem.idBoxItem == 0 {
                boxItem.idBoxItem = self?.box?.boxItems?.count ?? 0 + 1
            }
            self?.box?.boxItems?.append(boxItem)
        }.store(in: &token)
    }
}
