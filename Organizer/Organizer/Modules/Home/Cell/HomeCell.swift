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
            if box.imageName == nil {
                Image(systemName: "photo")
                    .frame(width: 60, height: 60)
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
            } else {
                Image(box.imageName ?? "photo")
                    .resizable()
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                    .frame(width: 60, height: 60)
            }
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
            HomeCell(box: Box(idBox: 0, titleBox: "Teste", description: "Description", imageName: nil, barcode: "123", boxItems: nil))
        }
    }
}
#endif
