//
//  HomeCell.swift
//  Organizer
//
//  Created by Anderson Carvalho on 21/11/20.
//

import SwiftUI

struct HomeCell : View {
    
    let box: Box
    
    var body: some View {
        HStack {
            
            ImageCustomCell(imageBase64: box.imageName)
            
            VStack(alignment: .leading) {
                Text(box.titleBox)
                    .font(.title)
                    .fontWeight(.bold)
                Text(box.description ?? "")
                    .lineLimit(2)
            }
        }.padding(.vertical, 8)
    }
}

#if DEBUG
struct HomeCell_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            HomeCell(box: Box(idBox: 0, titleBox: "Teste", description: "Description", imageName: "box_sample", barcode: "123", boxItems: nil))
        }
    }
}
#endif
