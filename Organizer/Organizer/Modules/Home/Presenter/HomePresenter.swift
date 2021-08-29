//
//  HomePresenter.swift
//  Organizer
//
//  Created by Anderson Carvalho on 29/11/20.
//

import Foundation

class HomePresenter: HomePresenterProtocol {
    
    var view: HomeViewProtocol?
    var wireFrame: HomeWireFrameProtocol?
    var dataModule: HomeDataModuleInputProtocol?
    
    private var boxes: [Box]? = []
    
    func viewDidLoad() {
        dataModule?.getBoxList()
    }
    
    func showBoxDetail(_ box: Box) {
        wireFrame?.showNewOrEditBox(from: view, box)
    }
    
    func showNewBox() {
        wireFrame?.showNewOrEditBox(from: view, nil)
    }
}

extension HomePresenter: HomeDataModuleOutputProtocol {
    func onError(_ error: String) {
        print(error)
    }
    
    func onSuccess(_ boxList: [BoxDM]?) {
        boxes = BoxDM.getBoxes(boxList)
        view?.showData(boxes ?? [])
    }
}
