//
//  NewBoxWireFrame.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 19/12/20.
//

import UIKit

class NewBoxWireFrame: NewBoxWireFrameProtocol {
    
    class func createViewController(_ box: Box?) -> UIViewController {
        
        let newBoxViewModel = NewBoxViewModel()
        newBoxViewModel.titleBox = box?.titleBox
        
        let newBoxView = NewBoxView(newBoxViewModel: newBoxViewModel)
        let viewController = NewBoxViewController(rootView: newBoxView)
        
        
        return viewController
    }
}
