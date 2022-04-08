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
    
    private var boxes: [BoxModel]? = []
    
    func viewDidLoad() {
        dataModule?.getBoxList()
    }
    
    func showBoxDetail(_ box: BoxModel) {
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
    
    func onSuccess(_ boxList: [BoxModel]?) {
        view?.showData(boxList ?? [])
    }
}
