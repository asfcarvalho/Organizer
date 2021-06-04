//
//  NewBoxItemViewController.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import SwiftUI
import Combine

class NewBoxItemViewController: UIHostingController<NewBoxItemView> {
    
    private var token = Set<AnyCancellable>()
    var presenter: NewBoxItemPresenterProtocol?
    
    override init(rootView: NewBoxItemView) {
        super.init(rootView:rootView)
        
        configureComunication()
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        presenter?.viewDidLoad()
    }
    
    func configureComunication() {
        rootView.saveBoxPublisher.sink { [weak self] newBoxViewModel in
            self?.presenter?.saveBoxItem()
        }.store(in: &token)

        rootView.textPublisher.sink { [weak self] textType in
            self?.presenter?.isSaveButtonEnabled(textType)
        }.store(in: &token)

        rootView.cameraPublisher.sink { [weak self] _ in
            self?.showCamera()
        }.store(in: &token)
    }
    
    fileprivate func showCamera() {
        let cameraView = UIImagePickerController()
        cameraView.delegate = self
        cameraView.sourceType = .camera
        cameraView.videoQuality = UIImagePickerController.QualityType.typeMedium
        presenter?.showCamera(cameraView)
    }
}

extension NewBoxItemViewController: NewBoxItemViewProtocol {
    func setSaveButtonEnabled(_ status: Bool) {
        rootView.newBoxItemViewModel.buttonEnabled = status
    }
}

extension NewBoxItemViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            let image64 = image.jpegData(compressionQuality: 0.5)?.base64EncodedString() ?? ""
            self.presenter?.isSaveButtonEnabled((TextTypeEnum.imageName, image64))
        }
        picker.dismiss(animated: true, completion: nil)
    }

    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
}
