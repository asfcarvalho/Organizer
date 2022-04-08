//
//  DetailCell.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 23/12/20.
//

import SwiftUI

struct DetailCell: View {
    
    var item: BoxItemModel
    
    var body: some View {
        if let imageName = item.imageName {
            NavigationLink(
                destination:
                    ImageFull(imageName: imageName, title: item.titleBoxItem)) {
                BoxItemCell(boxItem: item)
            }
        } else {
            BoxItemCell(boxItem: item)
        }
    }
}
