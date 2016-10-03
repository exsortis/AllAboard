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
     * A method that is called when the conductor finishes, whether from skipping or making it all the way to the end.
     */
    func conductorControllerFinished(_ controller : ConductorViewController)

    /**
     * Method called when the user has tapped the "skip" button. The delegate should dismiss the conductor UI and
     * continue with the app.
     */
    func conductorController(_ controller : ConductorViewController, userWantsToSkipAtPage pageNumber : Int)

}

/**
 * The view controller that manages the entire conductor UI.
 */
open class ConductorViewController: UIViewController, UIPageViewControllerDelegate {

    // MARK: - Properties

    fileprivate var currentPage : Int = 0
    fileprivate var pageViewController : UIPageViewController!

    /**
     * Interface Builder property for the background image of the conductor view.
     */
    @IBOutlet open weak var backgroundImageView: UIImageView!

    /**
     * An optional delegate for the conductor.
     */
    open weak var delegate : ConductorDelegate?
    /**
     * The data source for the conductor. This should be set before the view is loaded.
     */
    open var dataSource : ConductorDataSource!
    /**
     * The image to use for the page view background.
     */
    open var backgroundImage : UIImage?


    // MARK: - Initialization

    override open func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        if let image = backgroundImage {
            self.backgroundImageView.image = image
        }
    }


    // MARK: - Responder chain methods

    /**
     * This method is called via the responder chain when the user wants to advance the UI to the next page.
     */
    open func advance(_ sender : AnyObject?) {

        if currentPage >= dataSource.pageData.count {
            self.delegate?.conductorControllerFinished(self)

            if let nav = self.navigationController {
                nav.popViewController(animated: true)
            }
            else {
                self.dismiss(animated: true) {
                }
            }
        }
        else {
            if let vc = dataSource.viewController(for: currentPage + 1, from: self.storyboard!) {
                self.pageViewController.setViewControllers([ vc ], direction: .forward, animated: true, completion: nil)
                currentPage += 1
            }
        }
    }

    /**
     * This method is called via the responder chain when the user wants to skip the UI.
     */
    open func skip(_ sender : AnyObject?) {

        self.delegate?.conductorController(self, userWantsToSkipAtPage: self.currentPage)

        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        }
        else {
            self.dismiss(animated: true) {
            }
        }
    }


    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override open func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
        if segue.identifier == "EmbedPageView",
            let vc = segue.destination as? UIPageViewController {
            vc.dataSource = self.dataSource
            vc.delegate = self

            self.pageViewController = vc

            if let cpv = vc.storyboard?.instantiateViewController(withIdentifier: "ConductorPageView") as? ConductorPageViewController,
                let data = self.dataSource.pageData.first {
                cpv.pageData = data
                vc.setViewControllers([ cpv ], direction: .forward, animated: true) { completed in }
            }
        }
    }


    // MARK: - Page view controller delegate methods

    @objc open func pageViewControllerSupportedInterfaceOrientations(_ pageViewController: UIPageViewController) -> UIInterfaceOrientationMask {
        return .all
    }

    @objc open func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {

        if let cc = pendingViewControllers.first as? ConductorPageViewController {
            currentPage = cc.pageNumber
        }
    }

    //    @objc func pageViewController(pageViewController: UIPageViewController, spineLocationForInterfaceOrientation orientation: UIInterfaceOrientation) -> UIPageViewControllerSpineLocation {
    //        return .None
    //    }

    @objc open func pageViewController(_ pageViewController: UIPageViewController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
        
    }
    
}
