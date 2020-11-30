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
    
    private var boxes: [Box] = [
        Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "box_sample", barcode: "123", boxItems:
                [BoxItem(idBoxItem: 1, titleBoxItem: "Caix 1", description: "Controles", imageName: "box_sample"),
                 BoxItem(idBoxItem: 2, titleBoxItem: "Caix 2", description: "Controles", imageName: "box_sample"),
                 BoxItem(idBoxItem: 3, titleBoxItem: "Caix 3", description: "Controles", imageName: "box_sample")]),
        Box(idBox: 2, titleBox: "Title2", description: "Description2 Description2 Description2 Description2 Description2 Description2", imageName: nil, barcode: "123", boxItems: [
            BoxItem(idBoxItem: 1, titleBoxItem: "Caix 1", description: "Controles", imageName: "box_sample"),
             BoxItem(idBoxItem: 2, titleBoxItem: "Caix 2", description: "Controles", imageName: "box_sample")
        ])]
    
    func viewDidLoad() {
        view?.showData(boxes)
    }
    
    func showBoxDetail(_ box: Box) {
        wireFrame?.showBoxDetail(box)
    }
    
    func showNewBox() {
        
    }
}
