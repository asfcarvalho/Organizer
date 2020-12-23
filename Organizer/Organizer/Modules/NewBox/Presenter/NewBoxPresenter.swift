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
        dataModule?.saveBox(newBoxViewModel?.box)
    }
    
    func isSaveButtonEnabled(_ textType: TextType) {
        switch textType.0 {
        case .title:
            newBoxViewModel?.box?.titleBox = textType.1
        case .description:
            newBoxViewModel?.box?.description = textType.1
        case .qrcode:
            newBoxViewModel?.box?.barcode = textType.1
        default:
            newBoxViewModel?.box?.imageName = textType.1
        }
        
        let status = !(newBoxViewModel?.box?.titleBox.isEmpty ?? false) &&
            !(newBoxViewModel?.box?.description?.isEmpty ?? false) &&
            !(newBoxViewModel?.box?.barcode?.isEmpty ?? false) &&
            !(newBoxViewModel?.box?.imageName?.isEmpty ?? false) &&
            (newBoxViewModel?.box?.boxItems?.count ?? 0) > 0
        
        delegate?.setSaveButtonEnabled(status)
    }
    
    func showCamera(_ cameraView: UIViewController) {
        wireFrame?.showCamera(from: delegate, cameraView)
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
