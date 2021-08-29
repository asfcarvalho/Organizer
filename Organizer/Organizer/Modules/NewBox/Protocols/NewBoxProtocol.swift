//
//  NewBoxProtocol.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit

protocol NewBoxWireFrameProtocol {
    static func createViewController(_ box: Box?) -> UIViewController
    
    func showCamera(from viewController: NewBoxViewProtocol?, _ cameraView: UIViewController)
    func showNewBoxItem(from viewController: NewBoxViewProtocol?, _ boxItem: BoxItem?, _ newBoxViewModel: NewBoxViewModel?)
}

protocol NewBoxViewProtocol {
    var presenter: NewBoxPresenterProtocol? { get set }
    
    func showBox(_ newBoxViewModel: NewBoxViewModel)
    func setSaveButtonEnabled(_ status: Bool)
}

protocol NewBoxPresenterProtocol {
    var delegate: NewBoxViewProtocol? { get set }
    var wireFrame: NewBoxWireFrameProtocol? { get set }
    var dataModule: NewBoxDataModuleInputProtocol? { get set }
    
    func viewDidLoad()
    func isSaveButtonEnabled(_ textType: TextType)
    func saveBox()
    func showCamera(_ cameraView: UIViewController)
    func showBoxItem()
}

protocol NewBoxDataModuleInputProtocol {
    var presenter: NewBoxDataModuleOutputProtocol? { get set }
    
    func saveOrUpdateBox(_ box: Box?)
}

protocol NewBoxDataModuleOutputProtocol: class {
    func onError(_ error: String)
    func onSuccess()
}
