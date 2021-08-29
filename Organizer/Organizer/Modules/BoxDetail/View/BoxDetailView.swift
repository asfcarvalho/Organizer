//
//  BoxDetailView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 21/11/20.
//

import SwiftUI

struct BoxDetailView: View {
    
    var box = Box()
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 10),
                                  GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImageCustomTop(imageName: box.image)
                    .padding(.vertical, 16)
                VStack {
                    Text("Description")
                        .font(.headline)
                    Spacer()
                    Text(box.description ?? "")
                        .font(.body)
                }.padding(.bottom, 16)
                Divider().background(Color.gray)
                Text("Items")
                    .font(.headline)
                    .fontWeight(.bold)
                    .foregroundColor(Color.black)
                
                LazyVGrid(columns: gridItemLayout, spacing: 10) {
//                    ForEach(box.boxItemList ?? [], id: \.id) { item in
//                        DetailCell(item: item)
//                    }
                }
            }.padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
//        .navigationBarTitle(box.titleBox, displayMode: .inline)
        .clipped()
    }
}

struct ImageFull: View {
    
    var imageName: String
    var title: String
    
    var body: some View {
        VStack {
            GeometryReader { geo in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geo.size.width)
                    .cornerRadius(16)
                    .clipped()
                    .shadow(color: .black, radius: 16, x: 0, y: 0)
            }.padding(16)
        }.navigationBarTitle(title, displayMode: .inline)
    }
}

#if DEBUG
struct BoxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BoxDetailView()
            ImageFull(imageName: "box_sample", title: "Box 1")
        }
    }
}
#endif
