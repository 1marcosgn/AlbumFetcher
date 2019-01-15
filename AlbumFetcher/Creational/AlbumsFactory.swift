//
//  AlbumsFactory.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class AlbumsFactory {
    
    private static var sharedAlbumsFactory = AlbumsFactory()
    
    /// Single instance of Albums Factory
    class func shared() -> AlbumsFactory {
        return sharedAlbumsFactory
    }
    
    /**
     Creates and returns Albums based on a Dictionary with the albums information
     - parameter albums: Array of Dictionaries with information required to build an Album
     - returns: Array of Albums
     */
    public func makeAlbums(albums: [[String: Any]]) -> [Album]? {
        var albumsArray = [Album]()
        
        for album in albums {
            let albumObject = Album.init(information: album)
            albumsArray.append(albumObject)
        }
        
        return albumsArray
    }

}
