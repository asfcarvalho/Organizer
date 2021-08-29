//
//  DetailCell.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 23/12/20.
//

import SwiftUI

struct DetailCell: View {
    
    var item: BoxItem
    
    var body: some View {
        if let imageName = item.image {
            NavigationLink(
                destination:
                    ImageFull(imageName: imageName, title: item.title ?? "")) {
                BoxItemCell(boxItem: item)
            }
        } else {
            BoxItemCell(boxItem: item)
        }
    }
}
