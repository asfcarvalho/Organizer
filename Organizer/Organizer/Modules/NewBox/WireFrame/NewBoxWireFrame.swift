//
//  NewBoxWireFrame.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit

class NewBoxWireFrame: NewBoxWireFrameProtocol {
    
    class func createViewController() -> UIViewController {
        
        let newBoxView = NewBoxView()
        let viewController = NewBoxViewController(rootView: newBoxView)
        
        
        return viewController
    }
}
