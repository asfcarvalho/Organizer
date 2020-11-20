//
//  HomeView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 20/11/20.
//  
//

import SwiftUI

//MARK: HomeView SwiftUI
struct HomeView : View {
    
    var boxes: [Box] = [
        Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "photo", barcode: "123"),
        Box(idBox: 2, titleBox: "Title2", description: "Description2", imageName: "photo", barcode: "123")
    ]
    
    var body: some View {
        NavigationView {
            List {
                ForEach(boxes, id: \.idBox) { box in
                    HStack {
                        Image(systemName: box.imageName ?? "photo")
                        VStack(alignment: .leading) {
                            Text(box.titleBox)
                                .font(.title)
                                .fontWeight(.bold)
                            Text(box.description ?? "")
                        }
                    }
                }
            }.navigationBarTitle(Text("Boxes"))
        }
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
