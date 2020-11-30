//
//  HomeViewModel.swift
//  Organizer
//
//  Created by Anderson Carvalho on 29/11/20.
//

import SwiftUI

class HomeViewModel: ObservableObject {
    @Published var boxes = [Box]()
}
