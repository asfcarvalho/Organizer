//
//  BoxDetailView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 21/11/20.
//

import SwiftUI

struct BoxDetailView: View {
    
    var box = Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "box_sample", barcode: "123", boxItems: [
        BoxItem(idBoxItem: 1, titleBoxItem: "Caix 1", description: "Controles Controles Controles Controles Controles Controles Controles Controles Controles, Controles Controles Controles Controles Controles Controles Controles Controles Controles", imageName: "box_sample"),
        BoxItem(idBoxItem: 2, titleBoxItem: "Caix 2", description: "Controles", imageName: "box_sample"),
        BoxItem(idBoxItem: 3, titleBoxItem: "Caix 3", description: "Controles", imageName: "box_sample")
    ])
    
    var body: some View {
        VStack {
            List {
                Section(header: Text("Box detail")) {
                    VStack(alignment: .leading) {
                        Image("box_sample")
                            .resizable()
                            .scaledToFill()
                            .frame(height: 300)
                            .cornerRadius(9)
                            .clipped()
                            .shadow(color: .black, radius: 9, x: 0, y: 1)
                            .padding(.vertical, 16)
                        VStack {
                            Text("Description")
                                .font(.headline)
                            Spacer()
                            Text(box.description ?? "")
                                .font(.body)
                        }.padding(.bottom, 16)
                    }
                }
                Section(header: VStack(alignment: .center) {
                    Text("Items")
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color.black)
                    Spacer()
                }) {
                    ForEach(box.boxItems ?? [], id: \.idBoxItem) { item in
                        NavigationLink(
                            destination: ContentView()) {
                            BoxItemCell(boxItem: item)
                        }
                        
                    }
                }
            }.listStyle(GroupedListStyle())
            .navigationBarTitle(box.titleBox, displayMode: .inline)
        }
    }
}

struct BoxItemCell: View {
    
    var boxItem: BoxItem
    
    var body: some View {
        HStack(alignment: .top) {
            if boxItem.imageName == nil {
                Image(systemName: "photo")
                    .frame(width: 60, height: 60)
                    .overlay(RoundedRectangle(cornerRadius: 9)
                                .stroke(Color.gray, lineWidth: 2))
            } else {
                Image(boxItem.imageName ?? "photo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 60, height: 60)
                    .cornerRadius(9)
                    .clipped()
                    .overlay(RoundedRectangle(cornerRadius: 9)
                                .stroke(Color.gray, lineWidth: 2))
                    .padding(.vertical, 16)
                
            }
            Text(boxItem.description ?? "")
                .padding(EdgeInsets(top: 14, leading: 8, bottom: 16, trailing: 16))
        }
    }
}

#if DEBUG
struct BoxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoxDetailView()
    }
}
#endif
