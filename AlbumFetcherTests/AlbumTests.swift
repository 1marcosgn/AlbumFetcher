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
        let mockDictionary = AlbumTests.makeMockAlbumDictionary()
        
        // When
        let sut = Album.init(information: mockDictionary)
        
        // Then
        XCTAssertNotNil(sut, "Intialized Album that conforms 'InformationProtocol' should not be nil")
        XCTAssertNotNil(sut?.albumName, "Album name should not be nil")
        XCTAssertNotNil(sut?.artistName, "Artist name shoyld not be nil")
        XCTAssertNotNil(sut?.copyright, "Copy right should not be nil")
        XCTAssertNotNil(sut?.genres, "Array of genres should not be nil")
        XCTAssertNotNil(sut?.releaseDate, "Release Date should not be nil")
        XCTAssertNotNil(sut?.imageUrl, "Image Url should not be nil")
        
        XCTAssertEqual(sut?.albumName, "Future Hndrxx Presents: The WIZRD")
        XCTAssertEqual(sut?.artistName, "Future", "Artist name should match")
        XCTAssertEqual(sut?.copyright, "℗ 2019 Epic Records, a division of Sony Music Entertainment. With Freebandz.", "Copy right should match")
        XCTAssertEqual(sut?.genres?.count, 2,"Number of Genres for this album should match")
        XCTAssertEqual(sut?.releaseDate, "2019-01-18","Release date should match")
    }
    
    func testGetGenres_WithValidInformation_ShouldReturnArrayOfGenres() {
        /// Given
        let genres = AlbumTests.makeGenresArray()
        
        /// When
        let sut = Album.getGenres(genres)
        
        /// Then
        XCTAssertNotNil(sut, "Array of Genres should not be nil")
        XCTAssertEqual(sut?.count, 2, "Number of genres should match")
        XCTAssertEqual(sut?.first, "Hip-Hop/Rap", "Name of genre should match")
    }
    
    func testGetImageURL_WithValidInformation_ShouldReturnValidURL() {
        /// Given
        let mockUrlString = "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/ae/40/d6/ae40d6e3-cce3-a662-84da-0a2f8582f8ae/886447486191.jpg/200x200bb.png"
        
        /// When
        let sut = Album.getURL(mockUrlString)
        
        /// Then
        XCTAssertNotNil(sut, "Url should not be nil")
    }

}

extension AlbumTests {
    class func makeGenresArray() -> [[String: Any]]? {
        let genreA = ["genreId": "18", "name": "Hip-Hop/Rap", "url": "https://itunes.apple.com/us/genre/id18"]
        let genreB = ["genreId": "34", "name": "Music", "url": "https://itunes.apple.com/us/genre/id18"]
        
        return [genreA, genreB]
    }
    
    class func makeMockAlbumDictionary() -> [String: Any] {
        
        var dictionary = [String: Any]()
        
        dictionary["name"] = "Future Hndrxx Presents: The WIZRD"
        dictionary["artistName"] = "Future"
        dictionary["copyright"] = "℗ 2019 Epic Records, a division of Sony Music Entertainment. With Freebandz."
        dictionary["genres"] = makeGenresArray()
        dictionary["releaseDate"] = "2019-01-18"
        dictionary["artworkUrl100"] = "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/ae/40/d6/ae40d6e3-cce3-a662-84da-0a2f8582f8ae/886447486191.jpg/200x200bb.png"
        dictionary["url"] = "https://is3-ssl.mzstatic.com/image/thumb/Music114/v4/ae/40/d6/ae40d6e3-cce3-a662-84da-0a2f8582f8ae/886447486191.jpg/200x200bb.png"
        
        return dictionary
    }
}
