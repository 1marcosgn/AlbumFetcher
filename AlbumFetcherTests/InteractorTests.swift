//
//  InteractorTests.swift
//  AlbumFetcherTests
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class InteractorTests: XCTestCase {
    
    func test_requestAlbums_Should_Load_AvailableAlbums() {
        /// Given
        let sut = Interactor.init()
        let expectation = XCTestExpectation(description: "Call should be successfully completed")
        var mockInfo: [Album]?
        
        /// When
        sut.requestAlbums { (success, information, error) in
            if success {
                expectation.fulfill()
                mockInfo = information
            }
        }
        
        /// Then
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(mockInfo, "After fetching from API the available albums should not be nil")
    }
}
