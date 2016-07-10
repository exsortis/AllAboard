//
//  IntroPageData.swift
//  Conductor
//
//  Created by Paul Schifferer on 7/9/16.
//  Copyright © 2016 Pilgrimage Software. All rights reserved.
//

import UIKit


/**
 * Value object to store a conductor page.
 */
public struct ConductorPageData {
    /**
     * An optional title to display on the page.
     */
    public var titleText : String?
    /**
     * The body text to display on the page. This is the detailed explanation that the user will see.
     */
    public var bodyText : String
    /**
     * An optional image to be displayed on the page.
     */
    public var image : UIImage?
    /**
     * Optional text that should be displayed in the advance button. Defaults to a localized version of "Next".
     */
    public var advanceText : String?
    /**
     * Determines whether the skip button should be hidden on the page. Defaults to `false`.
     */
    public var hideSkipButton : Bool = false

    /**
     * Designated initializer.
     */
    public init(bodyText : String, titleText : String? = nil, image : UIImage? = nil, advanceText : String? = nil, hideSkipButton : Bool = false) {
        self.bodyText = bodyText
        self.titleText = titleText
        self.image = image
        self.advanceText = advanceText
        self.hideSkipButton = hideSkipButton
    }

}
