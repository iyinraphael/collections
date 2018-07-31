//
//  ItemDetailViewController.swift
//  Collection
//
//  Created by owner on 7/23/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class ItemDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        updateViews()
    }

    
    

    private func updateViews() {
        guard let item = item else {
            title = "New Collection"
            return
        }
        
        title = item.name
        
        nameTextField.text = item.name
        valueTextField.text = item.value
        locationTextField.text = item.location
    }
    
    
    @IBAction func save(_ sender: Any) {
        guard let name = nameTextField.text,
         let value = valueTextField.text,
         let location = locationTextField.text else {return}
        
        if let item = item {
            itemController?.update(item:item, withName: name, value: value, location: location)
        }else{
            let _ = itemController?.createNewItem(withName: name, value: value, location: location)
        }
        
        navigationController?.popViewController(animated: true)
    }
    
    //Properties
    var item: Item?
    var itemController: ItemController?
    
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var valueTextField: UITextField!
    @IBOutlet weak var locationTextField: UITextField!
    
    
}
