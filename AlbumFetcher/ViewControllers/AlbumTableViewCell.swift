//
//  AlbumTableViewCell.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {
    let labelArtistName = UILabel()
    let labelAlbumName = UILabel()
    let imageAlbum = UIImageView()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        //Set up UI
        setUpLabelArtistName()
        setUpLabelAlbumName()
        setUpImageAlbum()
    }
    
    func setUpLabelAlbumName() {
        labelAlbumName.backgroundColor = .white
        labelAlbumName.textColor = .black
        labelAlbumName.numberOfLines = 5
        self.addSubview(labelAlbumName)
        setLabelAlbumNameConstraints()
    }
    
    func setUpImageAlbum() {
        imageAlbum.backgroundColor = .gray
        self.addSubview(imageAlbum)
        setImageAlbumNameConstraints()
    }
    
    func setUpLabelArtistName() {
        labelArtistName.backgroundColor = .white
        labelArtistName.textColor = .red
        labelArtistName.numberOfLines = 2
        self.addSubview(labelArtistName)
        setLabelArtistNameConstraints()
    }
    
    func setLabelAlbumNameConstraints() {
        labelAlbumName.translatesAutoresizingMaskIntoConstraints = false
        labelAlbumName.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        labelAlbumName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        labelAlbumName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -140).isActive = true
        labelAlbumName.bottomAnchor.constraint(equalTo: labelArtistName.topAnchor, constant: -5).isActive = true
    }
    
    func setLabelArtistNameConstraints() {
        labelArtistName.translatesAutoresizingMaskIntoConstraints = false
        labelArtistName.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20).isActive = true
        labelArtistName.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        labelArtistName.heightAnchor.constraint(equalToConstant: 35).isActive = true
        labelArtistName.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -2).isActive = true
    }
    
    func setImageAlbumNameConstraints() {
        imageAlbum.translatesAutoresizingMaskIntoConstraints = false
        imageAlbum.topAnchor.constraint(equalTo: self.topAnchor, constant: 5).isActive = true
        imageAlbum.leadingAnchor.constraint(equalTo: labelAlbumName.trailingAnchor, constant: 5).isActive = true
        imageAlbum.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20).isActive = true
        imageAlbum.bottomAnchor.constraint(equalTo: labelArtistName.topAnchor, constant: -5).isActive = true
    }
}
