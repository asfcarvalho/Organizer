//
//  NewBoxItemPresenter.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import UIKit
import Combine

class NewBoxItemPresenter: NewBoxItemPresenterProtocol {

    var delegate: NewBoxItemViewProtocol?
    var wireFrame: NewBoxItemWireFrameProtocol?
    
    private var newBoxItemViewModel: NewBoxItemViewModel?
    private var newBoxViewModel: NewBoxViewModel?
    
    init(_ newBoxItemViewModel: NewBoxItemViewModel?,
         _ newBoxViewModel: NewBoxViewModel?) {
        self.newBoxItemViewModel = newBoxItemViewModel
        self.newBoxViewModel = newBoxViewModel
    }

    func viewDidLoad() {
        if newBoxViewModel?.box == nil {
            newBoxItemViewModel = NewBoxItemViewModel()
        }
//        if let newBoxItemViewModel = newBoxItemViewModel {
//            delegate?.showBox(newBoxViewModel)
//        }
    }
    
    func saveBoxItem() {
        newBoxViewModel?.newBoxItemPublisher.send(newBoxItemViewModel?.boxItem)
    }
    
    func isSaveButtonEnabled(_ textType: TextType) {
        switch textType.key {
        case .title:
            newBoxItemViewModel?.boxItem?.titleBoxItem = textType.value
        case .description:
            newBoxItemViewModel?.boxItem?.description = textType.value
        default:
            newBoxItemViewModel?.boxItem?.imageName = textType.value
        }
        
        let status = !(newBoxItemViewModel?.boxItem?.titleBoxItem.isEmpty ?? false) &&
            !(newBoxItemViewModel?.boxItem?.description?.isEmpty ?? false) //&&
//            !(newBoxItemViewModel?.boxItem?.imageName?.isEmpty ?? false)
        
        delegate?.setSaveButtonEnabled(status)
    }
    
    func showCamera(_ cameraView: UIViewController) {
        wireFrame?.showCamera(from: delegate, cameraView)
    }
}
