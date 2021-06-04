//
//  NewBoxItemView.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 04/06/21.
//

import SwiftUI
import Combine

struct NewBoxItemView: View {
    
    @ObservedObject var newBoxItemViewModel: NewBoxItemViewModel
    
    let saveBoxPublisher = PassthroughSubject<NewBoxItemViewModel, Never>()
    let textPublisher = PassthroughSubject<TextType, Never>()
    let cameraPublisher = ObservableObjectPublisher()
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var imageName: String = ""
    @State private var buttonEnabled: Bool = false
    
    @State private var gridItemLayout = [GridItem(.flexible(), spacing: 10),
                                  GridItem(.flexible(), spacing: 10)]
    
    init(newBoxItemViewModel: NewBoxItemViewModel) {
        UIScrollView.appearance().bounces = false
        self.newBoxItemViewModel = newBoxItemViewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                            ImageCustomTop(imageBase64: imageName)
                                .padding(.vertical, 16)
                            
                            Button(action: {
                                self.cameraPublisher.send()
                            }) {
                                ZStack {
                                    Circle()
                                        .fill()
                                        .foregroundColor(Color.black.opacity(0.5))
                                        .frame(width: 65, height: 65)
                                    Image(systemName: "camera.on.rectangle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                }
                            }.foregroundColor(.gray)
                            
                        }
                        
                        TextFieldCustom(title: "Title", placeholder: "Enter the title", fieldBeingEdited: $title) { editingChanged in
                            if !editingChanged {
                                self.textPublisher.send((TextTypeEnum.title, title))
                            }
                        }
                        
                        TextFieldCustom(title: "Description", placeholder: "Enter the description", fieldBeingEdited: $description, editingChanged: { editingChanged in
                            if !editingChanged {
                                self.textPublisher.send((TextTypeEnum.description, description))
                            }
                        })
                            .padding(.bottom, 16)
                    }.padding(.horizontal, 16)
                }
                .onTapGesture {
                    hideKeyboard()
                }
                VStack {
                    Button(action: {
                        self.saveBoxPublisher.send(NewBoxItemViewModel(title, description, imageName))
                    }) {
                        Text("Save")
                            .font(.body)
                            .fontWeight(.bold)
                    }.foregroundColor(.white)
                    .frame(width: geometry.size.width - 32, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(buttonColor)
                    .cornerRadius(9.0)
                    .padding(16)
                    .disabled(!buttonEnabled)
                }.shadow(color: .gray, radius: 9, x: 0.0, y: 1.0)
            }
        }.navigationBarTitle("New Box Item", displayMode: .inline)
        .clipped()
        .onReceive(newBoxItemViewModel.$boxItem, perform: { value in
            self.title = value?.titleBoxItem ?? ""
            self.description = value?.description ?? ""
            self.imageName = value?.imageName ?? ""
        })
        .onReceive(newBoxItemViewModel.$buttonEnabled, perform: { status in
            self.buttonEnabled = status ?? false
        })
    }
    
    private var buttonColor: Color {
        buttonEnabled ? Color.orange : Color.gray
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct NewBoxItemView_Previews: PreviewProvider {
    static var previews: some View {
        NewBoxItemView(newBoxItemViewModel: NewBoxItemViewModel())
    }
}
