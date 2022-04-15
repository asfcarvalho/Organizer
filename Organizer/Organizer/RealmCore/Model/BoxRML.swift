//
//  BoxRML.swift
//  Organizer
//
//  Created by Anderson F Carvalho on 15/04/22.
//

import Foundation
import RealmSwift

class BoxRLM: Object {
    override class func primaryKey() -> String? {
        #keyPath(id)
    }
    @Persisted @objc internal var id: String = ""
    @Persisted internal var titleBox: String = ""
    @Persisted internal var descriptionBox: String = ""
    @Persisted internal var imageName: String = ""
    @Persisted internal var barcode: String = ""
    @Persisted internal var boxItems: List<BoxItemRLM> = .init()
}

class BoxItemRLM: EmbeddedObject {
    @Persisted internal var idBoxItem: Int = 0
    @Persisted internal var titleBoxItem: String = ""
    @Persisted internal var descriptionItem: String = ""
    @Persisted internal var imageName: String = ""
}
