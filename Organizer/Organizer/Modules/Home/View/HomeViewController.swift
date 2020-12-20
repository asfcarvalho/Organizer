//
//  HomeViewController.swift
//  Organizer
//
//  Created by Anderson Carvalho on 29/11/20.
//

import Combine
import SwiftUI

class HomeViewController: UIHostingController<HomeView> {
    
    private var token = Set<AnyCancellable>()
    var presenter: HomePresenterProtocol?
    
    override init(rootView: HomeView) {
        super.init(rootView: rootView)
        
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
        rootView.selectedBoxPublisher.sink { [weak self] box in
            self?.presenter?.showBoxDetail(box)
        }.store(in: &token)
        
        rootView.selecteNewBoxPublisher.sink(receiveValue: { [weak self] box in
            self?.presenter?.showNewBox()
        }).store(in: &token)
    }
}

extension HomeViewController: HomeViewProtocol {
    func showData(_ boxes: [Box]) {
        rootView.homeViewModel.boxes = boxes
    }
    
    func showError(_ error: String) {
        
    }
}
