//
//  Interactor.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class Interactor {
    /// Method that uses the Service Implementer to gather albums from an external API
    public func requestAlbums(completion: @escaping (Bool, [Album]?, String?) -> ()) {
        let serviceImpl = ServicesImplementer.init()
        serviceImpl.fetchAlbums { [unowned self] (success, results, error) in
            
            if success {
                completion(true, self.makeAlbumsWith(results), nil)
            } else {
                completion(false, nil, error)
            }
        }
    }
    
    /// Uses the Factory Class to create albums based on the response
    public func makeAlbumsWith(_ content: [[String: Any]]?) -> [Album]? {
        guard let albums = AlbumsFactory.shared().makeAlbums(albums: content) else {
            return nil
        }
        
        return albums
    }
}
