//
//  NewBoxItemProtocol.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import UIKit

protocol NewBoxItemWireFrameProtocol {
    static func createViewController(_ boxItem: BoxItem?, _ newBoxViewModel: NewBoxViewModel?) -> UIViewController
    
    func showCamera(from viewController: NewBoxItemViewProtocol?, _ cameraView: UIViewController)
}

protocol NewBoxItemViewProtocol {
    var presenter: NewBoxItemPresenterProtocol? { get set }
    
    func setSaveButtonEnabled(_ status: Bool)
    func showBoxItem(_ newBoxItemViewModel: NewBoxItemViewModel)
}

protocol NewBoxItemPresenterProtocol {
    var delegate: NewBoxItemViewProtocol? { get set }
    var wireFrame: NewBoxItemWireFrameProtocol? { get set }
    
    func viewDidLoad()
    func isSaveButtonEnabled(_ textType: TextType)
    func saveBoxItem()
    func showCamera(_ cameraView: UIViewController)
}
