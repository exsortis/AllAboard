//
//  Conductor.swift
//  Conductor
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 */
public class Conductor {

    /**
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
