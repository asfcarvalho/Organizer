//
//  BoxDM+CoreDataClass.swift
//  Organizer
//
//  Created by Anderson Carvalho on 13/12/20.
//
//

import UIKit
import CoreData

@objc(BoxDM)
public class BoxDM: NSManagedObject {

    static func getBox(_ box: BoxDM?) -> Box? {
        guard let box = box else { return nil }
        let value = Box(idBox: Int(box.id),
                      titleBox: box.title ?? "",
                      description: box.boxDescription,
                      imageName: box.image,
                      barcode: box.barcode,
                      boxItems: BoxItemDM.getBoxItemList(box.boxItemList))
        return value
    }
    
    static func getBoxes(_ boxes: [BoxDM]?) -> [Box]? {
        guard let boxes = boxes else { return nil }
        var boxList = [Box]()
        boxes.forEach {
            if let value = BoxDM.getBox($0) {
                boxList.append(value)
            }
        }
        
        return boxList
    }
}
