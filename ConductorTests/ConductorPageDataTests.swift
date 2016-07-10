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
    
    func testPageData() {

        let pageData = ConductorPageData(titleText: "title", bodyText: "body", image: nil, advanceText: "go", hideSkipButton: true)

        XCTAssertTrue(pageData.titleText == "title")
        XCTAssertTrue(pageData.bodyText == "body")
        XCTAssertNil(pageData.image)
        XCTAssertTrue(pageData.advanceText == "go")
        XCTAssertTrue(pageData.hideSkipButton)
    }
    
}
