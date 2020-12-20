//
//  NewBoxViewModel.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 20/12/20.
//

import SwiftUI

class NewBoxViewModel: ObservableObject {
    @Published var boxe: Box?
    
    @Published var titleBox: String?
    @Published var descriptionBox: String?
    @Published var qrCodeBox: String?
}
