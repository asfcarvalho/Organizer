//
//  HomeWireFrame.swift
//  Organizer
//
//  Created by Anderson Carvalho on 29/11/20.
//

import UIKit

class HomeWireFrame: HomeWireFrameProtocol {
    
    class func createHomeView() -> UIViewController {
        
        let homeView = HomeView(homeViewModel: HomeViewModel())
        let vc = HomeViewController(rootView: homeView)
        let wireFrame = HomeWireFrame()
        var presenter: HomePresenterProtocol & HomeDataModuleOutputProtocol = HomePresenter()
        var dataModule: HomeDataModuleInputProtocol = HomeDataModule()
        vc.presenter = presenter
        presenter.wireFrame = wireFrame
        presenter.view = vc
        presenter.dataModule = dataModule
        dataModule.presenter = presenter
        
        return vc
    }
    
    func showBoxDetail(from vieController: HomeViewProtocol?, _ box: Box) {
        let boxDetail = BoxDetailWireFrame.createBoxDetailView(box)
            
        guard let vc = vieController as? HomeViewController else {
            return
        }
        boxDetail.modalPresentationStyle = .overFullScreen
        boxDetail.modalTransitionStyle = .crossDissolve
        vc.present(boxDetail, animated: true, completion: nil)
    }
}
