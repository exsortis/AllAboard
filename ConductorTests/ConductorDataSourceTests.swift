//
//  ConductorDataSourceTests.swift
//  Conductor
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import XCTest
import UIKit
@testable import Conductor


class ConductorDataSourceTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testDataSource() {

        let data : [ConductorPageData] = [
            ConductorPageData(bodyText: "body"),
        ]
        let dataSource = ConductorDataSource(pageData: data)

        let pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        let count = dataSource.presentationCount(for: pageViewController)

        XCTAssertTrue(count == 1)
    }

}
