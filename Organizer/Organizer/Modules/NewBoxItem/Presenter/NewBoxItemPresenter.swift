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
        if let newBoxItemViewModel = newBoxItemViewModel {
            delegate?.showBoxItem(newBoxItemViewModel)
        }
    }
    
    func saveBoxItem() {
        newBoxViewModel?.newBoxItemPublisher.send(newBoxItemViewModel?.boxItem)
    }
    
    func isSaveButtonEnabled(_ textType: TextType) {
        switch textType.key {
        case .title:
            newBoxItemViewModel?.boxItem?.title = textType.value
        case .description:
            newBoxItemViewModel?.boxItem?.boxItemDescription = textType.value
        default:
            newBoxItemViewModel?.boxItem?.image = textType.value
        }
        
        let status = !(newBoxItemViewModel?.boxItem?.title?.isEmpty ?? true) &&
            !(newBoxItemViewModel?.boxItem?.boxItemDescription?.isEmpty ?? true) &&
            !(newBoxItemViewModel?.boxItem?.image?.isEmpty ?? true)
        
        delegate?.setSaveButtonEnabled(status)
    }
    
    func showCamera(_ cameraView: UIViewController) {
        wireFrame?.showCamera(from: delegate, cameraView)
    }
}
