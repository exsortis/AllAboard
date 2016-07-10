//
//  ConductorPageDataTests.swift
//  Conductor
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import XCTest
@testable import Conductor


class ConductorPageDataTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testPageDataFullInit() {

        let pageData = ConductorPageData(bodyText: "body", titleText: "title", image: nil, advanceText: "go", hideSkipButton: true)

        XCTAssertTrue(pageData.titleText == "title")
        XCTAssertTrue(pageData.bodyText == "body")
        XCTAssertNil(pageData.image)
        XCTAssertTrue(pageData.advanceText == "go")
        XCTAssertTrue(pageData.hideSkipButton)
    }

    func testPageDataShortInit() {

        let pageData = ConductorPageData(bodyText: "body")

        XCTAssertNil(pageData.titleText)
        XCTAssertTrue(pageData.bodyText == "body")
        XCTAssertNil(pageData.image)
        XCTAssertNil(pageData.advanceText)
        XCTAssertFalse(pageData.hideSkipButton)
    }
    
}
