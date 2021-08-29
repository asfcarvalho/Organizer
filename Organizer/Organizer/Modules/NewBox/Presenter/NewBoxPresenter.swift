//
//  NewBoxPresenter.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit
import Combine

class NewBoxPresenter: NewBoxPresenterProtocol {
    
    var delegate: NewBoxViewProtocol?
    var wireFrame: NewBoxWireFrameProtocol?
    var dataModule: NewBoxDataModuleInputProtocol?
    private var newBoxViewModel: NewBoxViewModel?
    
    init(_ newBoxViewModel: NewBoxViewModel?) {
        self.newBoxViewModel = newBoxViewModel
    }

    func viewDidLoad() {
        if newBoxViewModel?.box == nil {
            newBoxViewModel = NewBoxViewModel()
        }
        if let newBoxViewModel = newBoxViewModel {
            delegate?.showBox(newBoxViewModel)
        }
    }
    
    func saveBox() {
        dataModule?.saveOrUpdateBox(newBoxViewModel?.box)
    }
    
    func isSaveButtonEnabled(_ textType: TextType) {
        switch textType.key {
        case .title:
            newBoxViewModel?.box?.title = textType.value
        case .description:
            newBoxViewModel?.box?.boxDescription = textType.value
        case .qrcode:
            newBoxViewModel?.box?.barcode = textType.value
        default:
            newBoxViewModel?.box?.image = textType.value
        }
        
        let status = !(newBoxViewModel?.box?.title?.isEmpty ?? true) &&
            !(newBoxViewModel?.box?.boxDescription?.isEmpty ?? true) &&
            !(newBoxViewModel?.box?.barcode?.isEmpty ?? true) &&
            !(newBoxViewModel?.box?.image?.isEmpty ?? true) &&
            (newBoxViewModel?.box?.boxItemList?.count ?? 0) > 0
        
        delegate?.setSaveButtonEnabled(status)
    }
    
    func showCamera(_ cameraView: UIViewController) {
        wireFrame?.showCamera(from: delegate, cameraView)
    }
    
    func showBoxItem() {
        wireFrame?.showNewBoxItem(from: delegate, nil, newBoxViewModel)
    }
}

extension NewBoxPresenter: NewBoxDataModuleOutputProtocol {
    func onError(_ error: String) {
        print(error)
    }
    
    func onSuccess() {
        print("SUCCESS")
    }
}
