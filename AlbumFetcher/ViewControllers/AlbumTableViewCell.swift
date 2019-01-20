//
//  AlbumTableViewCell.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class AlbumTableViewCellController: UITableViewCell {
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
        addSubview(labelAlbumName)
        setLabelAlbumNameConstraints()
    }
    
    func setUpImageAlbum() {
        imageAlbum.backgroundColor = .gray
        addSubview(imageAlbum)
        setImageAlbumNameConstraints()
    }
    
    func setUpLabelArtistName() {
        labelArtistName.backgroundColor = .white
        labelArtistName.textColor = .red
        labelArtistName.numberOfLines = 2
        addSubview(labelArtistName)
        setLabelArtistNameConstraints()
    }
    
    func setLabelAlbumNameConstraints() {
        labelAlbumName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelAlbumName.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.topCell),
            labelAlbumName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.leading),
            labelAlbumName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -140),
            labelAlbumName.bottomAnchor.constraint(equalTo: labelArtistName.topAnchor, constant: LayoutConstants.bottomCell)
        ])
    }
    
    func setLabelArtistNameConstraints() {
        labelArtistName.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            labelArtistName.leadingAnchor.constraint(equalTo: leadingAnchor, constant: LayoutConstants.leading),
            labelArtistName.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutConstants.trailing),
            labelArtistName.heightAnchor.constraint(equalToConstant: 35),
            labelArtistName.bottomAnchor.constraint(equalTo: bottomAnchor, constant: LayoutConstants.bottomCell)
        ])
    }
    
    func setImageAlbumNameConstraints() {
        imageAlbum.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            imageAlbum.topAnchor.constraint(equalTo: topAnchor, constant: LayoutConstants.topCell),
            imageAlbum.leadingAnchor.constraint(equalTo: labelAlbumName.trailingAnchor, constant: 5),
            imageAlbum.trailingAnchor.constraint(equalTo: trailingAnchor, constant: LayoutConstants.trailing),
            imageAlbum.bottomAnchor.constraint(equalTo: labelArtistName.topAnchor, constant: LayoutConstants.bottomCell)
        ])
    }
}
