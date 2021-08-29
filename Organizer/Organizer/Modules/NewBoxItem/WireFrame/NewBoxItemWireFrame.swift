//
//  NewBoxItemWireFrame.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import UIKit

class NewBoxItemWireFrame : NewBoxItemWireFrameProtocol {

    class func createViewController(_ boxItem: BoxItem?, _ newBoxViewModel: NewBoxViewModel?) -> UIViewController {
        
        var newBoxItemViewModel = NewBoxItemViewModel()
        if let boxItem = boxItem {
            newBoxItemViewModel = NewBoxItemViewModel(boxItem)
        }
        let newBoxItemView = NewBoxItemView(newBoxItemViewModel: newBoxItemViewModel)
        let viewController = NewBoxItemViewController(rootView: newBoxItemView)
        var presenter: NewBoxItemPresenterProtocol = NewBoxItemPresenter(newBoxItemViewModel, newBoxViewModel)
        let wireFrame: NewBoxItemWireFrameProtocol = NewBoxItemWireFrame()
        viewController.presenter = presenter
        presenter.delegate = viewController
        presenter.wireFrame = wireFrame
        
        return viewController
    }
    
    func showCamera(from viewController: NewBoxItemViewProtocol?, _ cameraView: UIViewController) {
        guard let viewController = viewController as? NewBoxItemViewController else { return }
        DispatchQueue.main.async {
            viewController.present(cameraView, animated: true, completion: nil)
        }
    }
}
