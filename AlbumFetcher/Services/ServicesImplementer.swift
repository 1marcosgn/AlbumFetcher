//
//  ServicesImplementer.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

/// Struct to manage the endpoints of the App
private struct Services {
    static let find_albums = "https://rss.itunes.apple.com/api/v1/us/apple-music/coming-soon/all/100/explicit.json"
}

public class ServicesImplementer {
   
    
    /// Call Web Service to fetch data .. this is an async task
    public func fetchAlbums(completion: @escaping (Bool, [[String: Any]]?, String?) -> ()) {
        downloadFileFromURL { (success, results, error) -> Void in
            completion(success, results, error)
        }
    }
}

/// Extension to download and parse albums information
internal extension ServicesImplementer {
    /**
     Simple method to download a JSON from external URL
     - parameter completion: The response of the opetarion
     */
    func downloadFileFromURL(completion: @escaping (Bool, [[String: Any]]?, String?) -> ()) {
        DispatchQueue.global().async {
            guard let endpointURL = URL(string: Services.find_albums) else {
                return
            }
            
            let config = URLSessionConfiguration.default
            let session = URLSession(configuration: config)
            let request = NSURLRequest(url: endpointURL)
            
            let dataTask = session.dataTask(with: request as URLRequest) { (data, response, error) in
                if let httpResponse = response as? HTTPURLResponse {
                    switch(httpResponse.statusCode) {
                    case 200:
                        guard
                            let data = data,
                            let json = (try? JSONSerialization.jsonObject(with: data)) as? [String: Any],
                            let feed = json[Constants.feed] as? [String: Any],
                            let results = feed[Constants.results] as? [[String: Any]]
                            else {
                                print(Constants.error, error ?? "")
                                return
                        }
                        //self.setUpAlbumsArrayWith(results)
                        completion(true, results, nil)
                    default:
                        let errorDescription = "GET request not successful HTTP status code: \(httpResponse.statusCode)"
                        completion(false, nil, errorDescription)
                    }
                } else {
                    let errorDescription = "Error: Not a valid HTTP response"
                    completion(false, nil, errorDescription)
                }
            }
            dataTask.resume()
        }
    }
    
   
}
