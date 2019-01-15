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
    
    public init(information: [String: Any]) {
        self.albumName = information["name"] as? String ?? ""
        self.artistName = information["artistName"] as? String ?? ""
        self.copyright = information["copyright"] as? String ?? ""
        self.genres = Album.getGenres(information["genres"] as? [[String : String]])
        self.releaseDate = information["releaseDate"] as? String ?? ""
        self.imageUrl = Album.getImageURL(information["artworkUrl100"] as? String)
    }
}

internal extension Album {
    
    class func getGenres(_ genresInfo:[[String: Any]]?) -> [String]? {
        var arrayOfGenres = [String]()
        guard let genres = genresInfo else {
            return nil
        }
        
        for genre in genres {
            guard let genreName = genre["name"] as? String else {
                return nil
            }
            arrayOfGenres.append(genreName)
        }
        return arrayOfGenres
    }
    
    class func getImageURL(_ url: String?) -> URL? {
        guard let urlString = url else {
            return nil
        }
        return URL(string: urlString)
    }
}
