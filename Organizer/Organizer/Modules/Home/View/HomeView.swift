//
//  HomeView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 20/11/20.
//
//

import Combine
import SwiftUI

//MARK: HomeView SwiftUI
struct HomeView : View {
    
    let selectedBoxPublisher = PassthroughSubject<Box, Never>()
    let selecteNewBoxPublisher = PassthroughSubject<Box?, Never>()
    @State private var isEmpty = false
    @ObservedObject var homeViewModel: HomeViewModel
        
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .center)) {
            if !isEmpty {
                VStack {
                    List {
                        ForEach(homeViewModel.boxes, id: \.idBox) { box in
                            HStack {
                                HomeCell(box: box)
                                Spacer()
                            }.contentShape(Rectangle())
                            .onTapGesture {
                                self.selectedBoxPublisher.send(box)
                            }
                        }
                    }.navigationBarTitle(Text("Boxes"))
                    .navigationBarItems(trailing:
                                            Image(systemName: "plus.rectangle.on.rectangle")
                                            .imageScale(.large)
                                            .foregroundColor(.black)
                                            .onTapGesture {
                                                self.selecteNewBoxPublisher.send(nil)
                                            }
                    )
                    .listStyle(PlainListStyle())
                    .onReceive(homeViewModel.$boxes, perform: { boxes in
                        if boxes.count > 0 {
                            isEmpty = false
                        } else {
                            isEmpty = true
                        }
                    })
                }
            }
            if isEmpty {
                Text("Empty list")
                    .fontWeight(.bold)
                    .multilineTextAlignment(.center)
                    .lineLimit(0)
                    .padding(.horizontal, 16.0)
                    .font(.title)
            }
        }.navigationBarColor(backgroundColor: .white)
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
        HomeView(homeViewModel: HomeViewModel())
    }
}
#endif
