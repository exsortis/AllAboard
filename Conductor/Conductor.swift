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
    
}
