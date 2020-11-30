//
//  ImageCustom.swift
//  Organizer
//
//  Created by Anderson Carvalho on 28/11/20.
//

import SwiftUI

struct ImageCustomCell: View {
    
    var imageName: String?
    
    var body: some View {
        if let imageName = imageName {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(9)
                .clipped()
                .overlay(RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.gray, lineWidth: 2))
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(width: 60, height: 60)
                .cornerRadius(9)
                .clipped()
                .overlay(RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.gray, lineWidth: 2))
                .foregroundColor(.gray)
        }
    }
}

struct ImageCustomTop: View {
    
    var imageName: String?
    
    var body: some View {
        if let imageName = imageName {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .cornerRadius(9)
                .clipped()
                .shadow(color: .black, radius: 9, x: 0, y: 1)
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(height: 300)
                .cornerRadius(9)
                .clipped()
                .foregroundColor(.gray)
        }
    }
}

struct ImageCustomDetailCell: View {
    
    var imageName: String?
    
    var body: some View {
        if let imageName = imageName {
            Image(imageName)
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, maxHeight: 250, alignment: .center)
                .cornerRadius(9)
                .clipped()
                .overlay(RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.gray, lineWidth: 2))
        } else {
            Image(systemName: "photo")
                .resizable()
                .scaledToFill()
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 250, maxHeight: 250, alignment: .center)
                .cornerRadius(9)
                .clipped()
                .overlay(RoundedRectangle(cornerRadius: 9)
                            .stroke(Color.gray, lineWidth: 2))
                .foregroundColor(.gray)
        }
    }
}
