//
//  ConductorTests.swift
//  ConductorTests
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import XCTest
@testable import Conductor


class ConductorTests: XCTestCase, ConductorDelegate {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRootObject() {

        let data : [ConductorPageData] = []
        let dataSource = ConductorDataSource(pageData: data)
        let vc = Conductor.viewControllerWithDataSource(dataSource)

        XCTAssertNotNil(vc)
    }

    func testRootObjectWithDelegate() {

        let data : [ConductorPageData] = []
        let dataSource = ConductorDataSource(pageData: data)
        let vc = Conductor.viewControllerWithDataSource(dataSource, delegate: self)

        XCTAssertNotNil(vc)
    }


    // MARK: - Conductor delegate methods

    func conductorControllerUserWantsToSkip(controller: ConductorViewController) {
        // ignore
    }
}
