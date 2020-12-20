//
//  NewBoxViewController.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import SwiftUI

class NewBoxViewController: UIHostingController<NewBoxView> {
    
    var presenter: NewBoxPresenterProtocol?
    
    override init(rootView: NewBoxView) {
        super.init(rootView:rootView)
    }
    
    @objc required dynamic init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter?.viewDidLoad()
    }
}

extension NewBoxViewController: NewBoxViewProtocol {
    func showBox(_ box: Box?) {
        
    }
}
