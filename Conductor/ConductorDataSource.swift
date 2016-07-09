//
//  IntroductionDataSource.swift
//  CharacterAdvisor
//
//  Created by Paul Schifferer on 7/4/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 */
public class ConductorDataSource : NSObject, UIPageViewControllerDataSource {

    private var pageData : [ConductorPageData]

    /**
     */
    public var startingPage : Int = 0

    // MARK: - Initialization

    /**
     */
    public init(pageData : [ConductorPageData]) {
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
