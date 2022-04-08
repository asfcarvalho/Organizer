//
//  NewBoxViewModel.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 20/12/20.
//

import SwiftUI
import Combine

class NewBoxViewModel: ObservableObject {
    @Published var box: BoxModel?
    @Published var buttonEnabled: Bool
    @Published var boxViewName: String
    
    private var isNewBox: Bool = true    
    private var token = Set<AnyCancellable>()
    let newBoxItemPublisher = PassthroughSubject<BoxItemModel?, Never>()
    
    init(_ box: BoxModel? = nil) {
        self.box = box
        if let box = box {
            self.boxViewName = box.titleBox ?? ""
        } else {
            self.isNewBox = true
            self.boxViewName = "New Box"
            self.box = BoxModel()
        }
        
        self.buttonEnabled = false
        configureComunication()
    }
    
    convenience init(_ title: String, _ description: String, _ qrCode: String,
                     _ imageName: String, _ items: [BoxItemModel]) {
        let box = BoxModel(titleBox: title,
                           description: description,
                           imageName: imageName,
                           barcode: qrCode,
                           boxItems: items)
        self.init(box)
    }
    
    private func configureComunication() {
        newBoxItemPublisher.sink { [weak self] boxItem in
            guard var boxItem = boxItem else { return }
            if boxItem.idBoxItem == 0 {
                boxItem.idBoxItem = self?.box?.boxItems?.count ?? 0 + 1
            }
            if self?.box?.boxItems == nil {
                self?.box?.boxItems = [boxItem]
            } else {
                self?.box?.boxItems?.append(boxItem)
            }
        }.store(in: &token)
    }
}
