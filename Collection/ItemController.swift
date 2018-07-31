//
//  ItemController.swift
//  Collection
//
//  Created by owner on 7/23/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import Foundation

class ItemController {
    
    func createNewItem(withName name: String, value: String, location: String) -> Item {
        let item = Item(name: name, value: value, location: location)
        items.append(item)
        return item
    }
    
    //when is the meeting?
    //do i have to finish my project before then?
    //lemme finish up
    //good for now
    
    
    //I need more clarity on how this function works
    func update(item: Item, withName name: String, value: String, location: String) {
        guard let index = items.index(of: item) else {return}
        
        var scratch = item
        scratch.name = name
        scratch.location = location
        scratch.value = value
        
        
        items.remove(at: index)
        items.insert(scratch, at: index)
    }
    
    private(set) var items: [Item] = []
    
}
