//
//  AlbumsTableViewController.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class AlbumsTableViewController: UITableViewController {
    public var interactor = Interactor()
    public var albums = [Album]()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setUpAlbums()
        configureTableView()
    }
}

/// Extension to hanlde Interactor Operations
extension AlbumsTableViewController {
    func setUpAlbums() {
        interactor.requestAlbums { [unowned self] (success, albums, error) in
            if success {
                guard let availableAlbums = albums else {
                    return
                }
                self.albums = availableAlbums
                
                DispatchQueue.main.async { [unowned self] in
                    self.tableView.reloadData()
                }
            } else {
                self.displayAlertViewWith(error)
            }
        }
    }
    
    func displayAlertViewWith(_ message: String?) {
        let alert = UIAlertController(title: "Alert", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { action in
            switch action.style{
            case .default:
                print("default")
                
            case .cancel:
                print("cancel")
                
            case .destructive:
                print("destructive")
                
                
            }}))
        self.present(alert, animated: true, completion: nil)
    }
}

// MARK: - Table view data source and Configuration
extension AlbumsTableViewController {
    
    func configureTableView() {
        tableView.register(AlbumTableViewCellController.self, forCellReuseIdentifier: Constants.albumCell)
        tableView.tableFooterView = UIView()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return albums.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.albumCell, for: indexPath) as! AlbumTableViewCellController
        cell.awakeFromNib()
        let album = albums[indexPath.row]
        cell.labelArtistName.text = album.artistName
        cell.labelAlbumName.text = album.albumName
        cell.imageAlbum.imageFromServerURL(urlString: album.imageUrl)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140.0
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let detailView = DetailViewController()
        let album = albums[indexPath.row]
        
        detailView.copyRightLabel.text = album.copyright
        detailView.releaseDateLabel.text = album.releaseDate
        detailView.genreLabel.text = album.genres?.joined(separator: Constants.separator)
        detailView.artistNameLabel.text = album.artistName
        detailView.albumNameLabel.text = album.albumName
        detailView.imageAlbum.imageFromServerURL(urlString: album.imageUrl)
        detailView.itunesLink = album.itunesLink
        navigationController?.pushViewController(detailView, animated: true)
    }
}

/// Extension to download the images
extension UIImageView {
    public func imageFromServerURL(urlString: URL?) {
        image = nil
        
        guard let imageURL = urlString else {
            return
        }
        
        URLSession.shared.dataTask(with: imageURL, completionHandler: { [weak self] (data, response, error) -> Void in
            if error != nil {
                print(error.debugDescription)
                return
            }
            DispatchQueue.main.async(execute: { () -> Void in
                let image = UIImage(data: data!)
                self?.image = image
            })
        }).resume()
    }
}

