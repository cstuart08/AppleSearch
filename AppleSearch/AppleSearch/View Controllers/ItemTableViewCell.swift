//
//  ItemTableViewCell.swift
//  AppleSearch
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var itemImageView: UIImageView!
    
    var item: AppStoreItem? {
        didSet {
            guard let item = item else { return }
            
            titleLabel.text = item.title
            subtitleLabel.text = item.subtitle
            //This prevents flickering on the images when you scroll fast.
            itemImageView.image = nil
            
            AppStoreItemController.getImageFor(item: item) { (image) in
                if let image = image {
                    DispatchQueue.main.async {
                        self.itemImageView.image = image
                    }
                } else {
                    print("Image was nil")
                }
            }
        }
    }
    
}
