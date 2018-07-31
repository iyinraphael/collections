//
//  CollectionTableViewController.swift
//  Collection
//
//  Created by owner on 7/23/18.
//  Copyright © 2018 iyin. All rights reserved.
//

import UIKit

class CollectionTableViewController: UITableViewController {

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tableView.reloadData()
    }



    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return itemController.items.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...
        let item = itemController.items[indexPath.row]
        cell.textLabel?.text = item.name

        return cell
    }


   

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowAddCollection" {
            guard let detailVC = segue.destination as? ItemDetailViewController else {return}
            detailVC.itemController = itemController
        }else if segue.identifier == "ShowCollectionDetail" {
            
        guard let detailVC = segue.destination as? ItemDetailViewController,
            let indexPath = tableView.indexPathForSelectedRow else {return}
            
            detailVC.itemController = itemController
            detailVC.item = itemController.items[indexPath.row]
    
            
        }
    }

    
    let itemController = ItemController()

}
