//
//  BoxItemDM+CoreDataClass.swift
//  Organizer
//
//  Created by Anderson Carvalho on 13/12/20.
//
//

import Foundation
import CoreData

@objc(BoxItemDM)
public class BoxItemDM: NSManagedObject {

    static func getBoxItem(_ boxItem: BoxItemDM) -> BoxItem {
        let boxItem = BoxItem(idBoxItem: Int(boxItem.id),
                              titleBoxItem: boxItem.title ?? "",
                              description: "",
                              imageName: boxItem.image)
        
        return boxItem
    }
    
    static func getBoxItemList(_ list: NSSet?) -> [BoxItem] {
        
        var boxItem = [BoxItem]()
        
        list?.forEach({ item in
            if let item = item as? BoxItemDM {
                boxItem.append(BoxItemDM.getBoxItem(item))
            }
        })
        
        return boxItem
    }
}
