//
//  NewBoxView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 28/11/20.
//

import SwiftUI
import Combine

struct NewBoxView: View {
    
    @ObservedObject var newBoxViewModel: NewBoxViewModel
    
    let saveBoxPublisher = PassthroughSubject<NewBoxViewModel, Never>()
    let cameraPublisher = ObservableObjectPublisher()
    let qrCodePublisher = ObservableObjectPublisher()
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var qrCode: String = ""
    
    @State private var gridItemLayout = [GridItem(.flexible(), spacing: 10),
                                  GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        GeometryReader { geometry in
            VStack {
                ScrollView {
                    VStack {
                        ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                            ImageCustomTop(imageName: "box_sample")
                                .padding(.vertical, 16)
                            
                            Button(action: {
                                print("Image")
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
                        VStack(alignment: .leading) {
                            ZStack(alignment: .trailing) {
                                TextFieldCustom(title: "QRCode", placeholder: "Enter the code", fieldBeingEdited: $qrCode)
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
                        TextFieldCustom(title: "Title", placeholder: "Enter the title", fieldBeingEdited: $title).onReceive(newBoxViewModel.$titleBox, perform: { value in
                            self.title = value ?? ""
                        })
                        TextFieldCustom(title: "Description", placeholder: "Enter the description", fieldBeingEdited: $description)
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
                                print("More item")
                            }) {
                                Image(systemName: "plus.square.fill.on.square.fill")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 30, height: 30)
                            }.foregroundColor(.gray)
                        }.padding(.bottom, 8)
                        
                        LazyVGrid(columns: gridItemLayout, spacing: 10) {
                            ImageCustomDetailCell(imageName: nil)
                            ImageCustomDetailCell(imageName: "box_sample")
                            ImageCustomDetailCell(imageName: nil)
                            ImageCustomDetailCell(imageName: "box_sample")
                        }.listRowBackground(Color(red: 0.949, green: 0.949, blue: 0.967))
                        .padding(.bottom, 16)
                    }.padding(.horizontal, 16)
                }
                .onTapGesture {
                    hideKeyboard()
                }
                VStack {
                    Button(action: {
                        print(title	)
                        self.saveBoxPublisher.send(newBoxViewModel)
                    }) {
                        Text("Save")
                            .font(.body)
                            .fontWeight(.bold)
                    }.foregroundColor(.white)
                    .frame(width: geometry.size.width - 32, height: 50, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color.orange)
                    .cornerRadius(9.0)
                    .padding(16)
                }.shadow(color: .gray, radius: 9, x: 0.0, y: 1.0)
            }
        }.navigationBarTitle("New Box", displayMode: .inline)
        .clipped()
    }
    
    private func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

struct TextFieldCustom: View {
    
    var title: String
    var placeholder: String
    var fieldBeingEdited: Binding<String>
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.semibold)
            TextField(placeholder, text: fieldBeingEdited)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.top, 8)
    }
}

struct NewBoxView_Previews: PreviewProvider {
    static var previews: some View {
        NewBoxView(newBoxViewModel: NewBoxViewModel())
    }
}
