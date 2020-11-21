//
//  BoxDetailView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 21/11/20.
//

import SwiftUI

struct BoxDetailView: View {
    
    var box = Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "box_sample", barcode: "123", boxItems: [
        BoxItem(idBoxItem: 0, titleBoxItem: "Caix 1", description: "Controles", imageName: "box_sample")
    ])
    
    var body: some View {
        NavigationView {
            VStack {
                Image("box_sample")
                    .resizable()
//                    .padding(.init(top: 32, leading: 16, bottom: 16, trailing: 16))
                    .clipped()
                Text("Title")
                List(0..<5) { item in
                    Text("Lista")
                }
            }
        }.navigationBarTitle("Box title")
    }
}

#if DEBUG
struct BoxDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BoxDetailView()
    }
}
#endif
