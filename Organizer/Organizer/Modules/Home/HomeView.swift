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
        Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "box_sample", barcode: "123", boxItems:
                [BoxItem(idBoxItem: 1, titleBoxItem: "Caix 1", description: "Controles", imageName: "box_sample"),
                 BoxItem(idBoxItem: 2, titleBoxItem: "Caix 2", description: "Controles", imageName: "box_sample"),
                 BoxItem(idBoxItem: 3, titleBoxItem: "Caix 3", description: "Controles", imageName: "box_sample")]),
        Box(idBox: 2, titleBox: "Title2", description: "Description2 Description2 Description2 Description2 Description2 Description2", imageName: nil, barcode: "123", boxItems: [
            BoxItem(idBoxItem: 1, titleBoxItem: "Caix 1", description: "Controles", imageName: "box_sample"),
             BoxItem(idBoxItem: 2, titleBoxItem: "Caix 2", description: "Controles", imageName: "box_sample")
        ])
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(boxes, id: \.idBox) { box in
                        NavigationLink(destination: BoxDetailView(box: box)) {
                            HomeCell(box: box)
                        }
                    }
                }.navigationBarTitle(Text("Boxes"))
                .navigationBarItems(trailing: Button(action: {
                    addAction()
                }) {
                    Image(systemName: "plus.rectangle.on.rectangle")
                        .imageScale(.large)
                        .foregroundColor(.black)
                })
                .listStyle(PlainListStyle())
                .navigationBarColor(backgroundColor: .white)
            }
        }
    }
    
    func addAction() {
        print("add")
    }
}

struct NavigationBarColor: ViewModifier {

    init(backgroundColor: UIColor) {
        let colorAppearance = UINavigationBarAppearance()
        colorAppearance.configureWithOpaqueBackground()
        colorAppearance.backgroundColor = backgroundColor
        colorAppearance.titleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
        colorAppearance.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.black]
                
        UINavigationBar.appearance().standardAppearance = colorAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = colorAppearance
        UINavigationBar.appearance().compactAppearance = colorAppearance
        UINavigationBar.appearance().tintColor = backgroundColor
        UINavigationBar.appearance().tintColor = .black
    }
    
    func body(content: Content) -> some View {
        content
    }
}

extension View {
    func navigationBarColor(backgroundColor: UIColor) -> some View {
        self.modifier(NavigationBarColor(backgroundColor: backgroundColor))
    }
}

#if DEBUG
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
#endif
