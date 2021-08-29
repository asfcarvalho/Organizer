//
//  NewBoxView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 28/11/20.
//

import SwiftUI
import Combine

enum TextTypeEnum {
    case title
    case description
    case qrcode
    case items
    case imageName
}

typealias TextType = (key: TextTypeEnum, value: String)

struct NewBoxView: View {
    
    @ObservedObject var newBoxViewModel: NewBoxViewModel
    
    let saveBoxPublisher = PassthroughSubject<NewBoxViewModel, Never>()
    let selecteNewBoxItemPublisher = PassthroughSubject<BoxItem?, Never>()
    let textPublisher = PassthroughSubject<TextType, Never>()
    let cameraPublisher = ObservableObjectPublisher()
    let qrCodePublisher = ObservableObjectPublisher()
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var qrCode: String = ""
    @State private var imageName: String = ""
    @State private var buttonEnabled: Bool = false
    @State private var items: [BoxItem] = []
    @State private var boxViewName = "New Box"
    @State private var isNewBox = true
    
    @State private var gridItemLayout = [GridItem(.flexible(), spacing: 10),
                                  GridItem(.flexible(), spacing: 10)]
    
    init(newBoxViewModel: NewBoxViewModel) {
        UIScrollView.appearance().bounces = false
        self.newBoxViewModel = newBoxViewModel
    }
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        // MARK: Image top
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
                                        .foregroundColor(Color.white.opacity(0.8))
                                }
                            }
                            
                        }.frame(minWidth: 0, maxWidth: .infinity)
                        // MARK: QRCode
                        VStack(alignment: .leading) {
                            ZStack(alignment: .trailing) {
                                TextFieldCustom(title: "QRCode", placeholder: "Enter the code", fieldBeingEdited: $qrCode) { editingChanged in
                                    if !editingChanged {
                                        self.textPublisher.send((TextTypeEnum.qrcode, qrCode))
                                    }
                                }
                                Button(action: {
                                    print($qrCode)
                                    self.qrCodePublisher.send()
                                }) {
                                    Image(systemName: "qrcode.viewfinder")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 25, height: 25)
                                        .padding(EdgeInsets(top: 40, leading: 0, bottom: 0, trailing: 6))
                                }.foregroundColor(.gray)
                            }
                        }.textFieldStyle(RoundedBorderTextFieldStyle())
                        .padding(.top, 8)
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
                        
                        Divider()
                            .frame(height: 1.0)
                            .background(Color.gray)
                        
                        HStack {
                            Text("Items")
                                .font(.title2)
                                .fontWeight(.semibold)
                            Spacer()
                            Button(action: {
                                self.selecteNewBoxItemPublisher.send(nil)
                            }) {
                                Image(systemName: "plus.square.fill.on.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }.foregroundColor(.gray)
                        }.padding(.bottom, 8)
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 10) {
                            ForEach(items, id: \.idBoxItem) { item in
                                DetailCell(item: item)
                            }
                        }.listRowBackground(Color(red: 0.949, green: 0.949, blue: 0.967))
                        .padding(.bottom, 16)
                    }.frame(minWidth: 0, maxWidth: .infinity)
                    .padding(.horizontal, 16)
                }
                .onTapGesture {
                    hideKeyboard()
                }
                VStack {
                    Button(action: {
                        self.saveBoxPublisher.send(NewBoxViewModel(title, description, qrCode, imageName, items))
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
            }.frame(width: geometry.size.width)
        }.navigationBarTitle(boxViewName, displayMode: .inline)
        .clipped()
        .onReceive(newBoxViewModel.$box, perform: { value in
            self.title = value?.titleBox ?? ""
            self.description = value?.description ?? ""
            self.qrCode = value?.barcode ?? ""
            self.imageName = value?.imageName ?? ""
            self.items = value?.boxItems ?? []
        })
        .onReceive(newBoxViewModel.$buttonEnabled, perform: { status in
            self.buttonEnabled = status
        })
        .onReceive(newBoxViewModel.$boxViewName, perform: { boxViewName in
            self.boxViewName = boxViewName
        })
    }
    
    private var buttonColor: Color {
        buttonEnabled ? Color.orange : Color.gray
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextFieldCustom: View {
    
    var title: String
    var placeholder: String
    var fieldBeingEdited: Binding<String>
    var editingChanged: (Bool) -> Void
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.semibold)
            TextField(placeholder, text: fieldBeingEdited, onEditingChanged: editingChanged)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.top, 8)
    }
}

struct NewBoxView_Previews: PreviewProvider {
    static var previews: some View {
        NewBoxView(newBoxViewModel: NewBoxViewModel())
    }
}
