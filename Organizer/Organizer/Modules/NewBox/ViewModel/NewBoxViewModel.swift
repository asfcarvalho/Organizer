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
    @Published var buttonEnabled: Bool
    @Published var boxViewName: String
    
    private var isNewBox: Bool = true    
    private var token = Set<AnyCancellable>()
    let newBoxItemPublisher = PassthroughSubject<BoxItem?, Never>()
    
    init(_ box: Box? = nil) {        
        self.box = box
        if let box = box {
            self.boxViewName = box.title ?? ""
        } else {
            self.isNewBox = true
            self.boxViewName = "New Box"
        }
        
        self.buttonEnabled = false
        configureComunication()
    }
    
    convenience init(_ title: String, _ description: String, _ qrCode: String,
                     _ imageName: String, _ items: [BoxItem]) {
        let box = Box()
        self.init(box)
    }
    
    private func configureComunication() {
        newBoxItemPublisher.sink { [weak self] boxItem in
            guard let boxItem = boxItem else { return }
            if boxItem.id == 0 {
                boxItem.id = Int64(self?.box?.boxItemList?.count ?? 0 + 1)
            }
            self?.box?.boxItemList?.adding(boxItem)
        }.store(in: &token)
    }
}
