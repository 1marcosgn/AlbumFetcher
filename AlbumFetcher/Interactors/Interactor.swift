//
//  Interactor.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class Interactor {
    
    /// Property to manage the available albums
    public var availableAlbums: [Album]?
    
    /// Method that uses the Service Implementer to gather albums from an external API
    public func requestAlbums(completion: @escaping (Bool) -> ()) {
        let serviceImpl = ServicesImplementer.init()
        serviceImpl.fetchAlbums { (success) in
            
            if success {
                self.makeAlbumsWith(serviceImpl.albums)
                completion(true)
            } else {
                completion(false)
            }
        }
    }
    
    /// Uses the Factory Class to create albums based on the response
    public func makeAlbumsWith(_ content: [[String: Any]]?) {
        guard let albums = AlbumsFactory.shared().makeAlbums(albums: content) else {
            return
        }
        
        availableAlbums = albums
    }
}
