//
//  IntroductionDataSource.swift
//  CharacterAdvisor
//
//  Created by Paul Schifferer on 7/4/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 * Canonical data source for a conductor view. You can make your own, but this one should do everything you need.
 */
public class ConductorDataSource : NSObject, UIPageViewControllerDataSource {

    private var pageData : [ConductorPageData]

    /**
     * Property to store the starting page of the view.
     */
    public var startingPage : Int = 0

    // MARK: - Initialization

    /**
     * Designated initializer for this data source.
     *
     * - parameter pageData: An array of `ConductorPageData` objects describing each page in the view.
     */
    public required init(pageData : [ConductorPageData]) {
        self.pageData = pageData
    }


    // MARK: - Data source methods

    @objc public func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController? {

        if let ivc = viewController as? ConductorPageViewController {
            let pageNumber = ivc.pageNumber

            if pageNumber > 0 {
                if let vc = pageViewController.storyboard?.instantiateViewControllerWithIdentifier("ConductorPageView") as? ConductorPageViewController {
                    vc.pageNumber = pageNumber - 1
                    vc.pageData = pageData[pageNumber - 1]
                }
            }
        }

        return nil
    }

    @objc public func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController? {

        if let ivc = viewController as? ConductorPageViewController {
            let pageNumber = ivc.pageNumber

            if pageNumber < pageData.count - 1 {
                if let vc = pageViewController.storyboard?.instantiateViewControllerWithIdentifier("ConductorPageView") as? ConductorPageViewController {
                    vc.pageNumber = pageNumber + 1
                    vc.pageData = pageData[pageNumber + 1]
                }
            }
        }
        
        return nil
    }

    public func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int {
        return pageData.count
    }

    public func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int {
        return startingPage
    }

}
