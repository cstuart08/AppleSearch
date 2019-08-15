//
//  MainTableViewController.swift
//  AppleSearch
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class MainTableViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var itemSearchBar: UISearchBar!
    @IBOutlet weak var itemSegmentedControl: UISegmentedControl!
    
    var appStoreItems: [AppStoreItem] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemSearchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchText = itemSearchBar.text, !searchText.isEmpty else { return }
        
        let itemType: AppStoreItem.ItemType = (itemSegmentedControl.selectedSegmentIndex == 0) ? .song : .app
        
        AppStoreItemController.getItems(type: itemType, searchText: searchText) { (items) in
            self.appStoreItems = items
            DispatchQueue.main.async {
                self.tableView.reloadData()
                self.itemSearchBar.text = ""
            }
        }
        
    }
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return appStoreItems.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "AppStoreItemCell", for: indexPath) as! ItemTableViewCell
        
        let appStoreItem = appStoreItems[indexPath.row]
        cell.item = appStoreItem
        
        // Configure the cell...
        
        return cell
    }
}
