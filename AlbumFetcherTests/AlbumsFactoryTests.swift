//
//  AlbumsFactoryTests.swift
//  AlbumFetcherTests
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class AlbumsFactoryTests: XCTestCase {

    func test_Factory_ShouldBeAbleTo_Create_Albums() {
        /// Given
        let sut = AlbumsFactory.shared()
        let albumsArray = [AlbumTests.makeMockAlbumDictionary(), AlbumTests.makeMockAlbumDictionary()]
        
        /// When
        let albums = sut.makeAlbums(albums: albumsArray)
        let album = albums?.first
        
        /// Then
        XCTAssertNotNil(albums, "Albums should not be nil")
        XCTAssertEqual(albums?.count, 2, "Albums array should contain 2 elements")
        XCTAssertEqual(album?.albumName, "Future Hndrxx Presents: The WIZRD")
        XCTAssertEqual(album?.albumName, "Future Hndrxx Presents: The WIZRD")
        XCTAssertEqual(album?.artistName, "Future", "Artist name should match")
        XCTAssertEqual(album?.copyright, "℗ 2019 Epic Records, a division of Sony Music Entertainment. With Freebandz.", "Copy right should match")
        XCTAssertEqual(album?.genres?.count, 2,"Number of Genres for this album should match")
        XCTAssertEqual(album?.releaseDate, "2019-01-18","Release date should match")
    }

}
