//
//  Box.swift
//  Organizer
//
//  Created by Anderson Carvalho on 20/11/20.
//

import Foundation

struct Box {
    let idBox: Int
    var titleBox: String
    var description: String?
    var imageName: String?
    var barcode: String?
    let boxItems: [BoxItem]?
}

struct BoxItem {
    let idBoxItem: Int
    let titleBoxItem: String
    let description: String?
    let imageName: String?
}
