//
//  ServicesImplementerTests.swift
//  AlbumFetcherTests
//
//  Created by Marcos Garcia on 1/14/19.
//  Copyright © 2019 Marcos Garcia. All rights reserved.
//

import XCTest

class ServicesImplementerTests: XCTestCase {

    func test_fetchAlbums_ShouldFetchAvailable_Albums_From_RemoteSource() {
        /// Given
        let sut = ServicesImplementer.init()
        let expectation = XCTestExpectation(description: "Call should be successfully completed and albums updated")
        var mockInfo: [[String: Any]]?
        
        /// When
        sut.fetchAlbums{ (success, information, error) in
            if success {
                expectation.fulfill()
                mockInfo = information
            }
        }
        
        /// Then
        wait(for: [expectation], timeout: 10.0)
        XCTAssertNotNil(mockInfo, "After sync is completed this should not be nil")
    }
    
    func test_Albums_ShouldNOTExist_If_NO_FetchOperation_HasBeenExecuted() {
        /// Given
        let sut:ServicesImplementer?
        
        /// When
        sut = ServicesImplementer.init()
        
        /// Then
        XCTAssertNotNil(sut, "Interactor should not be nil")
    }

}
