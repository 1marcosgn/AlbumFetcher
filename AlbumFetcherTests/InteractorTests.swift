//
//  InteractorTests.swift
//  AlbumFetcherTests
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class InteractorTests: XCTestCase {
    
    func test_requestAlbums_Should_Load_AvailableChallenges() {
        /// Given
        let sut = Interactor.init()
        let expectation = XCTestExpectation(description: "Call should be successfully completed")
        
        /// When
        sut.requestAlbums { (success) in
            if success {
                expectation.fulfill()
            }
        }
        
        /// Then
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(sut.availableAlbums, "After fetching from API the available albums should not be nil")
    }
}
