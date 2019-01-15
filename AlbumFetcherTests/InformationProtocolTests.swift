//
//  InformationProtocolTests.swift
//  AlbumFetcherTests
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class InformationProtocolTests: XCTestCase {

    func test_Object_ThatConformsInformationProtocol_ShouldContainValidData() {
        /// Given
        let mockImageURL = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/ae/40/d6/ae40d6e3-cce3-a662-84da-0a2f8582f8ae/886447486191.jpg/200x200bb.png")
        
        /// When
        let sut = MockAlbum(albumName: "Future Hndrxx Presents: The WIZRD", artistName: "Future", imageUrl: mockImageURL, genres: ["Hip-Hop/Rap"], releaseDate: "2019-01-18", copyright: "℗ 2019 Epic Records, a division of Sony Music Entertainment. With Freebandz.")
        
        /// Then
        XCTAssertNotNil(sut, "Intialized Album that conforms 'InformationProtocol' should not be nil")
    
        XCTAssertNotNil(sut.albumName, "Album name should not be nil")
        XCTAssertEqual(sut.albumName, "Future Hndrxx Presents: The WIZRD", "Album name should match")
    
        XCTAssertNotNil(sut.artistName, "Artist name shoyld not be nil")
        XCTAssertEqual(sut.artistName, "Future", "Artist name should match")
        XCTAssertNotNil(sut.releaseDate, "Release Date should not be nil")
        XCTAssertNotNil(sut.imageUrl, "Image Url should not be nil")
        XCTAssertNotNil(sut.genres, "Array of genres should not be nil")
        XCTAssertEqual(sut.genres?.count, 1,"Number of Genres for this album should match")
        XCTAssertNotNil(sut.copyright, "Copyright should not be nil")
    }
    
    func test_ObjectWithOptionals_ThatConformsInformationProtocol_ShouldContainValidData() {
        /// Given
        let mockAlbumName = "Future Hndrxx Presents: The WIZRD"
        let mockArtistName = "Future"
        
        /// When
        let sut = MockAlbum(albumName: mockAlbumName, artistName: mockArtistName, imageUrl: nil, genres: nil, releaseDate: "2019-01-18", copyright: nil)
        
        /// Then
        XCTAssertNil(sut.imageUrl, "Image Url should be nil when information is not provided")
        XCTAssertNil(sut.genres, "Array of genres should be nil")
        XCTAssertNil(sut.copyright, "Copyright should be nil")
        XCTAssertNotNil(sut, "Intialized Album that conforms 'InformationProtocol' should not be nil even if was initialized with optionals")
    }

}

class MockAlbum: InformationProtocol {
    var albumName: String
    var artistName: String
    var imageUrl: URL?
    var genres: [String]?
    var releaseDate: String
    var copyright: String?
    
    init(albumName: String, artistName: String, imageUrl: URL?, genres: [String]?, releaseDate: String, copyright: String?) {
        self.albumName = albumName
        self.artistName = artistName
        self.imageUrl = imageUrl
        self.genres = genres
        self.releaseDate = releaseDate
        self.copyright = copyright
    }
}
