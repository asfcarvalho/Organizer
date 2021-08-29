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
        
        let navigation = UINavigationController(rootViewController: vc)
        navigation.navigationBar.prefersLargeTitles = true        
        
        return navigation
    }
    
    func showNewOrEditBox(from viewController: HomeViewProtocol?, _ box: Box?) {
        let newBox = NewBoxWireFrame.createViewController(box)
        
        guard let vc = viewController as? HomeViewController else {
            return
        }
        
        DispatchQueue.main.async {
            vc.navigationController?.pushViewController(newBox, animated: true)
        }
    }
}
