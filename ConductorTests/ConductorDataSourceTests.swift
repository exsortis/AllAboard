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

        let data : [ConductorPageData] = []
        let dataSource = ConductorDataSource(pageData: data)

        let pageViewController = UIPageViewController(transitionStyle: .Scroll, navigationOrientation: .Horizontal, options: nil)
        let count = dataSource.presentationCountForPageViewController(pageViewController)

        XCTAssertTrue(count == 0)
    }

}
