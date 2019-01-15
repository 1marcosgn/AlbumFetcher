//
//  AlbumTests.swift
//  AlbumFetcherTests
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class AlbumTests: XCTestCase {
    
    func test_AlbumObject_Initialized_ShouldContainValidData() {
        /// Given
        let mockImageURL = URL(string: "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/ae/40/d6/ae40d6e3-cce3-a662-84da-0a2f8582f8ae/886447486191.jpg/200x200bb.png")
        
        // When
        let sut = Album(albumName: "Album Name Test", artistName: "Artist Name Test", imageUrl: mockImageURL, genres: ["Rock", "Rap"], releaseDate: Date(), copyright: "Test Copyright")
        
        // Then
        XCTAssertNotNil(sut, "Intialized Album that conforms 'InformationProtocol' should not be nil")
        
        XCTAssertNotNil(sut.albumName, "Album name should not be nil")
        XCTAssertEqual(sut.albumName, "Album Name Test")
        
        XCTAssertNotNil(sut.artistName, "Artist name shoyld not be nil")
        XCTAssertEqual(sut.artistName, "Artist Name Test", "Artist name should match")
        
        XCTAssertNotNil(sut.imageUrl, "Image Url should not be nil")
        XCTAssertNotNil(sut.releaseDate, "Release Date should not be nil")
        XCTAssertNotNil(sut.genres, "Array of genres should not be nil")
        XCTAssertEqual(sut.genres?.count, 2,"Number of Genres for this album should match")
        XCTAssertNotNil(sut.copyright, "Test Copyright")
        
    }

}
