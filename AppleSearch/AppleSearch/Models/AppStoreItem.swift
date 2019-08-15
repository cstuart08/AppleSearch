//
//  AppStoreItem.swift
//  AppleSearch
//
//  Created by Apps on 8/14/19.
//  Copyright © 2019 Apps. All rights reserved.
//

import Foundation

struct AppStoreItem {
    let title: String
    let subtitle: String
    let imageURL: String?
    
    enum ItemType: String {
        case app = "software"
        case song = "musicTrack"
    }
}

extension AppStoreItem {
    
    init?(itemType: AppStoreItem.ItemType, dict: [String:Any]) {
        
        if itemType == .app {
            // build an app AppStoreItem
            guard let title = dict["trackName"] as? String,
                let subtitle = dict["description"] as? String else { return nil }
            let imageURL = dict["artworkUrl100"] as? String
            
            self.title = title
            self.subtitle = subtitle
            self.imageURL = imageURL
            
            
        } else if itemType == .song {
            // builf a song AppStoreItem
            guard let title = dict["artistName"] as? String,
                let subtitle = dict["trackName"] as? String else { return nil }
            let imageURL = dict["artworkUrl100"] as? String
            
            self.title = title
            self.subtitle = subtitle
            self.imageURL = imageURL
            
        } else {
            print("Forgot to add availability for other types of items.")
            return nil
        }
    }
}
