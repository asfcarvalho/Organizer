//
//  NewBoxPresenter.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit

class NewBoxPresenter: NewBoxPresenterProtocol {
    var delegate: NewBoxViewProtocol?
    var wireFrame: NewBoxWireFrameProtocol?
    private var box: Box?
    
    init(_ box: Box?) {
        self.box = box
    }
    
    func viewDidLoad() {
        if box != nil {
            delegate?.showBox(box)
        }
    }
}
