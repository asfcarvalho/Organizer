//
//  HomeProtocol.swift
//  Organizer
//
//  Created by Anderson Carvalho on 29/11/20.
//

import UIKit

protocol HomeWireFrameProtocol {
    static func createHomeView() -> UIViewController
    
    func showBoxDetail(from vieController: HomeViewProtocol?, _ box: Box)
    func showNewBox(from viewController: HomeViewProtocol?, _ box: Box?) 
}

protocol HomeViewProtocol {
    var presenter: HomePresenterProtocol? { get set }
    
    func showData(_ boxes: [Box])
    func showError(_ error: String)
}

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    var wireFrame: HomeWireFrameProtocol? { get set }
    var dataModule: HomeDataModuleInputProtocol? { get set }
    
    func viewDidLoad()
    func showBoxDetail(_ box: Box)
    func showNewBox()
}

protocol HomeDataModuleInputProtocol {
    var presenter: HomeDataModuleOutputProtocol? { get set }
    
    func getBoxList()
}

protocol HomeDataModuleOutputProtocol: class {
    func onError(_ error: String)
    func onSuccess(_ boxList: [BoxDM]?)
}
