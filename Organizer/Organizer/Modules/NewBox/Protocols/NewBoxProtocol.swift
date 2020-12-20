//
//  NewBoxProtocol.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit

protocol NewBoxWireFrameProtocol {
    static func createViewController(_ box: Box?) -> UIViewController
}

protocol NewBoxViewProtocol {
    var presenter: NewBoxPresenterProtocol? { get set }
    
    func showBox(_ box: Box?)
}

protocol NewBoxPresenterProtocol {
    var delegate: NewBoxViewProtocol? { get set }
    var wireFrame: NewBoxWireFrameProtocol? { get set }
    
    func viewDidLoad()
}
