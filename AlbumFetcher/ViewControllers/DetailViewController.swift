//
//  DetailViewController.swift
//  AlbumFetcher
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import UIKit

struct LayoutConstants {
    static let leading: CGFloat = 20
    static let trailing: CGFloat = -20
    static let negativeBottom: CGFloat = -10
    static let top: CGFloat = 10
    static let bottomBtn: CGFloat = -20
    static let iTunesButtonHeight: CGFloat = 50
    static let albumLabelHeight: CGFloat = 80
    static let artistLabelHeight: CGFloat = 40
    static let genreLabelHeight: CGFloat = 50
    static let releaseLabelHeight: CGFloat = 30
    static let copyRightLabelHeight: CGFloat = 60
    static let topCell: CGFloat = 5
    static let bottomCell: CGFloat = -5
}

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
    }
    
    override func loadView() {
        super.loadView()
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
        
        NSLayoutConstraint.activate([
            iTunesButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            iTunesButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            iTunesButton.heightAnchor.constraint(equalToConstant: LayoutConstants.iTunesButtonHeight),
            iTunesButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: LayoutConstants.bottomBtn)
        ])
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
        
        NSLayoutConstraint.activate([
            imageAlbum.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: LayoutConstants.top),
            imageAlbum.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            imageAlbum.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            imageAlbum.bottomAnchor.constraint(equalTo: albumNameLabel.topAnchor, constant: LayoutConstants.bottomBtn)
        ])
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
        
        NSLayoutConstraint.activate([
            albumNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            albumNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            albumNameLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.albumLabelHeight),
            albumNameLabel.bottomAnchor.constraint(equalTo: artistNameLabel.topAnchor, constant: LayoutConstants.negativeBottom)
        ])
    }
    
    func setUpArtistNameLabel() {
        artistNameLabel.textColor = .black
        artistNameLabel.numberOfLines = 2
        view.addSubview(artistNameLabel)
        setArtistNameLabelConstraints()
    }
    
    func setArtistNameLabelConstraints() {
        artistNameLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            artistNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            artistNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            artistNameLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.artistLabelHeight),
            artistNameLabel.bottomAnchor.constraint(equalTo: genreLabel.topAnchor, constant: LayoutConstants.negativeBottom)
        ])
    }
    
    func setUpGenreLabel() {
        genreLabel.textColor = .black
        genreLabel.numberOfLines = 4
        view.addSubview(genreLabel)
        setGenreLabelConstraints()
    }
    
    func setGenreLabelConstraints() {
        genreLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            genreLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            genreLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            genreLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.genreLabelHeight),
            genreLabel.bottomAnchor.constraint(equalTo: releaseDateLabel.topAnchor, constant: LayoutConstants.negativeBottom)
        ])
    }
    
    func setUpReleaseDateLabel() {
        releaseDateLabel.textColor = .black
        releaseDateLabel.numberOfLines = 1
        view.addSubview(releaseDateLabel)
        setReleaseDateLabelConstraints()
    }
    
    func setReleaseDateLabelConstraints() {
        releaseDateLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            releaseDateLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            releaseDateLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            releaseDateLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.releaseLabelHeight),
            releaseDateLabel.bottomAnchor.constraint(equalTo: copyRightLabel.topAnchor, constant: LayoutConstants.negativeBottom)
        ])
    }
    
    func setUpCopyRightLabel() {
        copyRightLabel.textColor = .black
        copyRightLabel.numberOfLines = 3
        view.addSubview(copyRightLabel)
        setCopyRightLabelConstraints()
    }
    
    func setCopyRightLabelConstraints() {
        copyRightLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            copyRightLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: LayoutConstants.leading),
            copyRightLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: LayoutConstants.trailing),
            copyRightLabel.heightAnchor.constraint(equalToConstant: LayoutConstants.copyRightLabelHeight),
            copyRightLabel.bottomAnchor.constraint(equalTo: iTunesButton.topAnchor, constant: LayoutConstants.negativeBottom)
        ])
    }
}
