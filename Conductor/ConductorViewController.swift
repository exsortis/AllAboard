//
//  IntroductionViewController.swift
//  CharacterAdvisor
//
//  Created by Paul Schifferer on 7/4/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 * A protocol defining the delegate methods for a conductor view.
 */
public protocol ConductorDelegate : class {

    /**
     * Method called when the user has tapped the "skip" button. The delegate should dismiss the conductor UI and
     * continue with the app.
     */
    func conductorControllerUserWantsToSkip(controller : ConductorViewController)

}

/**
 * The view controller that manages the entire conductor UI.
 */
public class ConductorViewController: UIViewController, UIPageViewControllerDelegate {

    // MARK: - Properties

    /**
     * Interface Builder property for the background image of the conductor view.
     */
    @IBOutlet public weak var backgroundImageView: UIImageView!

    /**
     * An optional delegate for the conductor.
     */
    public weak var delegate : ConductorDelegate?
    /**
     * The data source for the conductor. This should be set before the view is loaded.
     */
    public var dataSource : ConductorDataSource!


    // MARK: - Initialization

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    // MARK: - Responder chain methods

    /**
     * This method is called via the responder chain when the user wants to advance the UI to the next page.
     */
    public func advanceTouched(sender : AnyObject?) {

    }

    /**
     * This method is called via the responder chain when the user wants to skip the UI.
     */
    public func skipTouched(sender : AnyObject?) {

        self.delegate?.conductorControllerUserWantsToSkip(self)

        if let nav = self.navigationController {
            nav.popViewControllerAnimated(true)
        }
        else {
            self.dismissViewControllerAnimated(true) {
            }
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override public func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EmbedPageView",
            let vc = segue.destinationViewController as? UIPageViewController {
            vc.dataSource = self.dataSource
            vc.delegate = self

            if let cpv = vc.storyboard?.instantiateViewControllerWithIdentifier("ConductorPageView") as? ConductorPageViewController,
                let data = self.dataSource.pageData.first {
                cpv.pageData = data
                vc.setViewControllers([ cpv ], direction: .Forward, animated: true) { completed in }
            }
        }
    }


    // MARK: - Page view controller delegate methods

    @objc public func pageViewControllerSupportedInterfaceOrientations(pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return .All
    }

    @objc public func pageViewController(pageViewController: UIPageViewController, willTransitionToViewControllers pendingViewControllers: [UIViewController]) {

    }

    //    @objc func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
    //        return .None
    //    }

    @objc public func pageViewController(pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
}
