//
//  Album.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

struct Album {
    let albumName: String
    let artistName: String
    let imageUrl: URL?
    let genres: [String]?
    let releaseDate: String
    let copyright: String?
    let itunesLink: URL?
    
    /// Optional initializer to create Albums only when Data has the right Format
    public init?(information: [String: Any]) {
        /// Validation to get the right format for the Album properties
        guard let albumName = information[Constants.name] as? String,
            let artistName = information[Constants.artistName] as? String,
                let copyright = information[Constants.copyright] as? String,
                    let genres = Album.getGenres(information[Constants.genres] as? [[String : String]]),
                        let releaseDate = information[Constants.releaseDate] as? String,
                            let imageUrl = Album.getURL(information[Constants.artworkUrl] as? String),
                                let itunesLink = Album.getURL(information[Constants.url] as? String) else {
                                    return nil
        }
        
        /// Valid data for properties
        self.albumName = albumName
        self.artistName = artistName
        self.copyright = copyright
        self.genres = genres
        self.releaseDate = releaseDate
        self.imageUrl = imageUrl
        self.itunesLink = itunesLink
    }
}

internal extension Album {
    static func getGenres(_ genresInfo:[[String: Any]]?) -> [String]? {
        var arrayOfGenres = [String]()
        guard let genres = genresInfo else {
            return nil
        }
        
        for genre in genres {
            guard let genreName = genre[Constants.name] as? String else {
                return nil
            }
            arrayOfGenres.append(genreName)
        }
        return arrayOfGenres
    }
    
    static func getURL(_ url: String?) -> URL? {
        guard let urlString = url else {
            return nil
        }
        return URL(string: urlString)
    }
}
