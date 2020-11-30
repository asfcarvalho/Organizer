//
//  BoxDetailView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 21/11/20.
//

import SwiftUI

struct BoxDetailView: View {
    
    var box = Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "box_sample", barcode: "123", boxItems: [
        BoxItem(idBoxItem: 1, titleBoxItem: "Caix 1", description: "Controles Controles Controles Controles Controles Controles Controles Controles Controles, Controles Controles Controles Controles Controles Controles Controles Controles Controles", imageName: nil),
        BoxItem(idBoxItem: 2, titleBoxItem: "Caix 2", description: "Controles", imageName: nil),
        BoxItem(idBoxItem: 3, titleBoxItem: "Caix 3", description: "Controles", imageName: "box_sample"),
        BoxItem(idBoxItem: 4, titleBoxItem: "Caix 4", description: "Controles", imageName: nil)
    ])
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 10),
                                  GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ImageCustomTop(imageName: box.imageName)
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
                    ForEach(box.boxItems ?? [], id: \.idBoxItem) { item in
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
            }.padding(.horizontal, 16)
            .padding(.bottom, 16)
        }
        .navigationBarTitle(box.titleBox, displayMode: .inline)
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
