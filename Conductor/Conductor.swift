//
//  Conductor.swift
//  Conductor
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 * A helper object for creating a Conductor view controller.
 */
open class Conductor {

    /**
     * Class method to create a Conductor view controller.
     *
     * - parameter dataSource: The data source that will provide page data
     * - parameter delegate: An optional delegate
     * - return: A Conductor view controller to display, or `nil` if it couldn't be created
     */
    open class func viewControllerWithDataSource(_ dataSource : ConductorDataSource, delegate : ConductorDelegate? = nil) -> ConductorViewController? {

        let storyboard = UIStoryboard(name: "Conductor", bundle: Bundle(for: self))
        if let vc = storyboard.instantiateInitialViewController() as? ConductorViewController {
            vc.dataSource = dataSource
            vc.delegate = delegate

            return vc
        }

        return nil
    }

    /**
     * Sets the font used for the title label in all page views. Defaults to the bold system font at point size 24.
     */
    open static var titleFont : UIFont = UIFont.boldSystemFont(ofSize: 24)
    /**
     * Sets the font used for the body text in all page views. Defaults to the system font at point size 14.
     */
    open static var textFont : UIFont = UIFont.systemFont(ofSize: 14)
    /**
     * Sets the font used for the advance button in all page views. Defaults to the system font at point size 17.
     */
    open static var advanceButtonFont : UIFont = UIFont.systemFont(ofSize: 17)
    /**
     * Sets the font used for the skip button in all page views. Defaults to the system font at point size 11.
     */
    open static var skipButtonFont : UIFont = UIFont.systemFont(ofSize: 11)
    
}
