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

    // MARK: - Properties

    /**
     * Property for accessing page data set during initialization.
     */
    public fileprivate(set) var pageData : [ConductorPageData]

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


    // MARK: - API

    public func viewController(for pageNumber : Int, from storyboard : UIStoryboard) -> UIViewController? {

        guard pageNumber < self.pageData.count else { return nil }
        guard let vc = storyboard.instantiateViewController(withIdentifier: "ConductorPageView") as? ConductorPageViewController else { return nil }

        vc.pageNumber = pageNumber

        var pageData = self.pageData[pageNumber]

        if pageNumber == self.pageData.count - 1 {
            // last page
            pageData.hideSkipButton = true
        }
        else {
            // not the last page
            pageData.advanceText = nil
        }

        vc.pageData = pageData

        return vc
    }


    // MARK: - Page view controller data source methods

    @objc public func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {

        if let ivc = viewController as? ConductorPageViewController {
            let pageNumber = ivc.pageNumber

            if pageNumber > 0 {
                return self.viewController(for: pageNumber - 1, from: viewController.storyboard!)
            }
        }

        return nil
    }

    @objc public func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {

        if let ivc = viewController as? ConductorPageViewController {
            let pageNumber = ivc.pageNumber

            if pageNumber < pageData.count - 1 {
                return self.viewController(for: pageNumber + 1, from: viewController.storyboard!)
            }
        }

        return nil
    }

    public func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return pageData.count
    }
    
    public func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        return startingPage
    }
    
}
