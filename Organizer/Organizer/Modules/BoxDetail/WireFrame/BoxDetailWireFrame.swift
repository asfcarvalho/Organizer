//
//  BoxDetailWireFrame.swift
//  Organizer
//
//  Created by Anderson Carvalho on 29/11/20.
//

import UIKit

class BoxDetailWireFrame: BoxDetailWireFrameProtocol {
    class func createBoxDetailView(_ box: Box) -> UIViewController {
        
        let boxDetailView = BoxDetailView()
        let vc = BoxDetailViewController(rootView: boxDetailView)
        
        return vc
    }
}
