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
        let presenter = HomePresenter()
        vc.presenter = presenter
        presenter.wireFrame = wireFrame
        presenter.view = vc
        
        return vc
    }
    
    func showBoxDetail(_ box: Box) {
        print(box)
    }
}
