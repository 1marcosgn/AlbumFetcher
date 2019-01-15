//
//  Album.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class Album: InformationProtocol {
    var albumName: String
    var artistName: String
    var imageUrl: URL?
    var genres: [String]?
    var releaseDate: Date
    var copyright: String?
    
    init(albumName: String, artistName: String, imageUrl: URL?, genres: [String]?, releaseDate: Date, copyright: String?) {
        self.albumName = albumName
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.genres = genres
        self.releaseDate = releaseDate
        self.copyright = copyright
    }
}
