//
//  BoxItemCell.swift
//  Organizer
//
//  Created by Anderson Carvalho on 28/11/20.
//

import SwiftUI

struct BoxItemCell: View {
    
    var boxItem: BoxItemModel
    
    var body: some View {
        ZStack(alignment: .bottom) {
            ImageCustomDetailCell(imageBase64: boxItem.imageName)
            Text(boxItem.titleBoxItem)
                .font(.body)
                .fontWeight(.semibold)
                .foregroundColor(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
                .multilineTextAlignment(.center)
                .padding(.bottom, 15.0)
        }.background(Color.clear)
    }
}
