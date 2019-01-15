//
//  Album.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class Album: InformationProtocol {
    var albumName: String = ""
    var artistName: String = ""
    var imageUrl: URL? = nil
    var genres: [String]? = nil
    var releaseDate: String = ""
    var copyright: String? = ""
    var itunesLink: URL? = nil
    
    public init(information: [String: Any]) {
        self.albumName = information[Constants.name] as? String ?? ""
        self.artistName = information[Constants.artistName] as? String ?? ""
        self.copyright = information[Constants.copyright] as? String ?? ""
        self.genres = Album.getGenres(information[Constants.genres] as? [[String : String]])
        self.releaseDate = information[Constants.releaseDate] as? String ?? ""
        self.imageUrl = Album.getURL(information[Constants.artworkUrl] as? String)
        self.itunesLink = Album.getURL(information[Constants.url] as? String)
    }
}

internal extension Album {
    
    class func getGenres(_ genresInfo:[[String: Any]]?) -> [String]? {
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
    
    class func getURL(_ url: String?) -> URL? {
        guard let urlString = url else {
            return nil
        }
        return URL(string: urlString)
    }
}
