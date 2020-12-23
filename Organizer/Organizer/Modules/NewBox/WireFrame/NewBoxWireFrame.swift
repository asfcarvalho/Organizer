//
//  NewBoxWireFrame.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit

class NewBoxWireFrame: NewBoxWireFrameProtocol {
    
    class func createViewController(_ box: Box?) -> UIViewController {
        
        let newBoxViewModel = NewBoxViewModel(box)
        let newBoxView = NewBoxView(newBoxViewModel: newBoxViewModel)
        let viewController = NewBoxViewController(rootView: newBoxView)
        var presenter: NewBoxPresenterProtocol & NewBoxDataModuleOutputProtocol = NewBoxPresenter(newBoxViewModel)
        var dataModule: NewBoxDataModuleInputProtocol = NewBoxDataModule()
        let wireFrame: NewBoxWireFrameProtocol = NewBoxWireFrame()
        viewController.presenter = presenter
        presenter.delegate = viewController
        presenter.dataModule = dataModule
        dataModule.presenter = presenter
        presenter.wireFrame = wireFrame
        
        return viewController
    }
    
    func showCamera(from viewController: NewBoxViewProtocol?, _ cameraView: UIViewController) {        
        guard let viewController = viewController as? NewBoxViewController else { return }
        DispatchQueue.main.async {
            viewController.present(cameraView, animated: true, completion: nil)
        }
    }
}
