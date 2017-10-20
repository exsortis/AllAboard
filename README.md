
[![Build Status](https://travis-ci.org/exsortis/Conductor.svg?branch=master)](https://travis-ci.org/exsortis/Conductor) [![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage#adding-frameworks-to-an-application) [![Cocoapods compatible](https://img.shields.io/cocoapods/v/Conductor.svg?style=flat)](https://cocoapods.org/pods/Conductor) [![License: MIT](https://img.shields.io/cocoapods/l/Conductor.svg?style=flat)](http://opensource.org/licenses/MIT)

# Conductor

A framework for providing an app "on-boarding" UI

## Usage

Conductor provides a user interface for on-boarding users to a new app, or to an updated version
of an app.

### Integration

#### CocoaPods

To use Conductor with CocoaPods, add the following line to your `Podfile`:

```ruby
pod 'Conductor'
```

#### Carthage

To use Conductor with Carthage, add the following line to your `Cartfile`:

```carthage
github "exsortis/Conductor"
```

### Setup the data source

The first thing you need to do to get Conductor working is to setup a data source that will
feed the presentation.

```swift
let pages = [
    ConductorPageData(bodyText: "Page 1", image: page1Image),
    ConductorPageData(bodyText: "Page 2", image: page2Image),
    ConductorPageData(bodyText: "Page 3"),
]
let dataSource = ConductorDataSource(pageData: pages)
```

### Create the view controller

Once the data source is setup, create the view controller and present it:

```swift
// TODO: make this view controller conform to ConductorDelegate

let vc = Conductor.viewControllerWithDataSource(dataSource, delegate: self)
// populate the appearance properties
Conductor.titleFont = appTitleFont
Conductor.textFont = appTextFont
// more...

self.present(vc, animated: true, completion: nil)
```

In the delegate, implement the following methods:

```swift
func conductorControllerFinished(_ controller : ConductorViewController) {
    // the user made it to the end, dismiss the controller
    controller.dismiss(animated: true, completion: nil)
}

func conductorController(_ controller : ConductorViewController, userWantsToSkipAtPage pageNumber : Int) {
    // the user decided they've seen enough, dismiss the controller
    // maybe save the page for later
    controller.dismiss(animated: true, completion: nil)
}

```

## Copyright

Copyright © 2016-7 Pilgrimage Software

## License

See [LICENSE](LICENSE) for details.
