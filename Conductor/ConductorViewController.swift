//
//  IntroductionViewController.swift
//  CharacterAdvisor
//
//  Created by Paul Schifferer on 7/4/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 */
public protocol ConductorDelegate : class {

    /**
     */
    func conductorControllerUserWantsToSkip(controller : ConductorViewController)

}

/**
 */
public class ConductorViewController: UIViewController, UIPageViewControllerDelegate {

    /**
     */
    @IBOutlet weak var backgroundImageView: UIImageView!

    /**
     */
    public weak var delegate : ConductorDelegate?
    /**
     */
    public var dataSource : ConductorDataSource!

    override public func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    // MARK: - Responder chain methods

    /**
     */
    public func advanceTouched(sender : AnyObject?) {

    }

    /**
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
        if segue.identifier == "EmbedPageView" {
            if let vc = segue.destinationViewController as? UIPageViewController {
                vc.dataSource = self.dataSource
                vc.delegate = self

                if let iv = vc.storyboard?.instantiateViewControllerWithIdentifier("ConductorPageView") {
                    vc.setViewControllers([ iv ], direction: .Forward, animated: true) { completed in
                    }
                }
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
