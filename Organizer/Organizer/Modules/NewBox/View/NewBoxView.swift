//
//  NewBoxView.swift
//  Organizer
//
//  Created by Anderson Carvalho on 28/11/20.
//

import SwiftUI

struct NewBoxView: View {
    
    @State private var title: String = "Box 1"
    @State private var description: String = "Box 1"
    @State private var qrCode: String = "1256541"
    
    private var gridItemLayout = [GridItem(.flexible(), spacing: 10),
                                  GridItem(.flexible(), spacing: 10)]
    
    var body: some View {
        ScrollView {
            VStack {
                ZStack(alignment: Alignment(horizontal: .trailing, vertical: .bottom)) {
                    ImageCustomTop(imageName: "box_sample")
                        .padding(.vertical, 16)
                    
                    Button(action: {
                        print("Image")
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
                    Text("QRCode")
                        .fontWeight(.semibold)
                    ZStack(alignment: .trailing) {
                        TextField("Enter the code", text: $qrCode)
                        Button(action: {
                            print($qrCode)
                        }) {
                            Image(systemName: "qrcode.viewfinder")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 25, height: 25)
                        }.foregroundColor(.gray)
                    }
                }.textFieldStyle(RoundedBorderTextFieldStyle())
                .padding(.top, 8)
                TextFieldCustom(title: "Title", placeholder: "Enter the title")
                TextFieldCustom(title: "Description", placeholder: "Enter the description")
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
    @State var text: String = "Box 1"
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .fontWeight(.semibold)
            TextField(placeholder, text: $text)
        }.textFieldStyle(RoundedBorderTextFieldStyle())
        .padding(.top, 8)
    }
}

struct NewBoxView_Previews: PreviewProvider {
    static var previews: some View {
        NewBoxView()
    }
}
