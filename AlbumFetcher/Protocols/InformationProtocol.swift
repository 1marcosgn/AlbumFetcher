//
//  InformationProtocol.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

/// This protocol manages the information associated to a particular Album
public protocol InformationProtocol {
    // The name of the album
    var albumName: String { get set }
    
    // The name of the artist
    var artistName: String { get set }
    
    // The url of the thumbnail image, the image url is optional since it is possible this does not exist
    var imageUrl: URL? { get set }
    
    // Array that contains the associated genres of the album, optional maybe no gender apply for an album
    var genres: [String]? { get set }
    
    // The release date of the album
    var releaseDate: String { get set }
    
    // Album copy right, this is optional since the album could be considered in the public domain after certain time
    var copyright: String? { get set }
}
