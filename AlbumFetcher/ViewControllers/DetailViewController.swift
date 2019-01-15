//
//  DetailViewController.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    let iTunesButton = UIButton()
    let imageAlbum = UIImageView()
    
    let albumNameLabel = UILabel()
    let artistNameLabel = UILabel()
    
    let genreLabel = UILabel()
    let releaseDateLabel = UILabel()
    let copyRightLabel = UILabel()
    
    var itunesLink: URL? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        setUpITunesButton()
        setUpCopyRightLabel()
        setUpReleaseDateLabel()
        setUpGenreLabel()
        setUpArtistNameLabel()
        setUpAlbumNameLabel()
        setUpImageView()
    }
}

/// Set up Button
extension DetailViewController {
    func setUpITunesButton() {
        iTunesButton.backgroundColor = .white
        iTunesButton.setTitleColor(.red, for: .normal)
        iTunesButton.setTitle(Constants.openInItunes, for: .normal)
        iTunesButton.addTarget(self, action: #selector(iTunesButtonTapped), for: .touchUpInside)
        view.addSubview(iTunesButton)
        setITunesButtonConstraints()
    }
    
    @objc func iTunesButtonTapped() {
        guard let itunesUrl = itunesLink else {
            return
        }
        UIApplication.shared.open(itunesUrl, options: [:], completionHandler: nil)
    }
    
    func setITunesButtonConstraints() {
        iTunesButton.translatesAutoresizingMaskIntoConstraints = false
        iTunesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        iTunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        iTunesButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        iTunesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20).isActive = true
    }
}

/// Set up Image View
extension DetailViewController {
    func setUpImageView() {
        imageAlbum.backgroundColor = .lightGray
        view.addSubview(imageAlbum)
        setImageViewConstraints()
    }
    
    func setImageViewConstraints() {
        imageAlbum.translatesAutoresizingMaskIntoConstraints = false
        imageAlbum.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10).isActive = true
        imageAlbum.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        imageAlbum.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        imageAlbum.bottomAnchor.constraint(equalTo: albumNameLabel.topAnchor, constant: -20).isActive = true
    }
}

/// Set up Album information Labels
extension DetailViewController {
    
    func setUpAlbumNameLabel() {
        albumNameLabel.textColor = .black
        albumNameLabel.numberOfLines = 5
        view.addSubview(albumNameLabel)
        setAlbumNameLabelConstraints()
    }
    
    func setAlbumNameLabelConstraints() {
        albumNameLabel.translatesAutoresizingMaskIntoConstraints = false
        albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        albumNameLabel.heightAnchor.constraint(equalToConstant: 80).isActive = true
        albumNameLabel.bottomAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: -10).isActive = true
    }
    
    func setUpArtistNameLabel() {
        artistNameLabel.textColor = .black
        artistNameLabel.numberOfLines = 2
        view.addSubview(artistNameLabel)
        setArtistNameLabelConstraints()
    }
    
    func setArtistNameLabelConstraints() {
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        artistNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        artistNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        artistNameLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        artistNameLabel.bottomAnchor.constraint(equalTo: genreLabel.topAnchor, constant: -10).isActive = true
    }
    
    func setUpGenreLabel() {
        genreLabel.textColor = .black
        genreLabel.numberOfLines = 4
        view.addSubview(genreLabel)
        setGenreLabelConstraints()
    }
    
    func setGenreLabelConstraints() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        genreLabel.heightAnchor.constraint(equalToConstant: 50).isActive = true
        genreLabel.bottomAnchor.constraint(equalTo: releaseDateLabel.topAnchor, constant: -10).isActive = true
    }
    
    func setUpReleaseDateLabel() {
        releaseDateLabel.textColor = .black
        releaseDateLabel.numberOfLines = 1
        view.addSubview(releaseDateLabel)
        setReleaseDateLabelConstraints()
    }
    
    func setReleaseDateLabelConstraints() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        releaseDateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
        releaseDateLabel.bottomAnchor.constraint(equalTo: copyRightLabel.topAnchor, constant: -10).isActive = true
    }
    
    func setUpCopyRightLabel() {
        copyRightLabel.textColor = .black
        copyRightLabel.numberOfLines = 3
        view.addSubview(copyRightLabel)
        setCopyRightLabelConstraints()
    }
    
    func setCopyRightLabelConstraints() {
        copyRightLabel.translatesAutoresizingMaskIntoConstraints = false
        copyRightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        copyRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        copyRightLabel.heightAnchor.constraint(equalToConstant: 60).isActive = true
        copyRightLabel.bottomAnchor.constraint(equalTo: iTunesButton.topAnchor, constant: -10).isActive = true
    }
}
