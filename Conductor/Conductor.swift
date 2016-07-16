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
public class Conductor {

    /**
     * Class method to create a Conductor view controller.
     *
     * - parameter dataSource: The data source that will provide page data
     * - parameter delegate: An optional delegate
     * - return: A Conductor view controller to display, or `nil` if it couldn't be created
     */
    public class func viewControllerWithDataSource(dataSource : ConductorDataSource, delegate : ConductorDelegate? = nil) -> ConductorViewController? {

        let storyboard = UIStoryboard(name: "Conductor", bundle: NSBundle(forClass: self))
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
    public static var titleFont : UIFont = UIFont.boldSystemFontOfSize(24)
    /**
     * Sets the font used for the body text in all page views. Defaults to the system font at point size 14.
     */
    public static var textFont : UIFont = UIFont.systemFontOfSize(14)
    /**
     * Sets the font used for the advance button in all page views. Defaults to the system font at point size 17.
     */
    public static var advanceButtonFont : UIFont = UIFont.systemFontOfSize(17)
    /**
     * Sets the font used for the skip button in all page views. Defaults to the system font at point size 11.
     */
    public static var skipButtonFont : UIFont = UIFont.systemFontOfSize(11)
    
}
