//
//  Box.swift
//  Organizer
//
//  Created by Anderson Carvalho on 20/11/20.
//

import Foundation

public struct BoxModel: Identifiable {
    public var id: String = UUID().uuidString
    var titleBox: String
    var description: String?
    var imageName: String?
    var barcode: String?
    var boxItems: [BoxItemModel]?
    
    public init(titleBox: String = "", description: String? = nil, imageName: String? = nil, barcode: String? = nil, boxItems: [BoxItemModel]? = nil) {
        self.titleBox = titleBox
        self.description = description
        self.imageName = imageName
        self.barcode = barcode
        self.boxItems = boxItems
    }
}

public struct BoxItemModel: Hashable {
    var idBoxItem: Int
    var titleBoxItem: String
    var description: String?
    var imageName: String?
    
    public init(idBoxItem: Int = 0, title: String = "", description: String? = nil, imageName: String? = nil) {
        self.idBoxItem = idBoxItem
        self.titleBoxItem = title
        self.description = description
        self.imageName = imageName
    }
}
