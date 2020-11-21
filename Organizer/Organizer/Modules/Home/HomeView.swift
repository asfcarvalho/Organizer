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
    
    init() {
        UITableView.appearance().backgroundColor = .white
    }
    
    var boxes: [Box] = [
        Box(idBox: 1, titleBox: "Title", description: "Description", imageName: "box_sample", barcode: "123", boxItems: nil),
        Box(idBox: 2, titleBox: "Title2", description: "Description2 Description2 Description2 Description2 Description2 Description2", imageName: nil, barcode: "123", boxItems: nil)
    ]
    
    var body: some View {
        NavigationView {
            VStack {
                List {
                    ForEach(boxes, id: \.idBox) { box in
                        HomeCell(box: box)
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
            }
        }.navigationBarColor(backgroundColor: .white)
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
        
        UINavigationBar.appearance().standardAppearance = colorAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = colorAppearance
        UINavigationBar.appearance().compactAppearance = colorAppearance
        UINavigationBar.appearance().tintColor = backgroundColor
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
