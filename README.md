# Connectastic iOS

* Written using [XCode 7.1](https://developer.apple.com/xcode/).
* You need XCode Command Line Tools. Install by typing `xcode-select --install` in a terminal window.
* Built using [XCTool](https://github.com/facebook/xctool). You **NEED** xctool >= 2.6 to be able to run tests via the command line. Install xctool using brew. Run tests on the command line using `bin/test.sh`. 
* Using [CocoaPods](http://cocoapods.org/) to manage dependencies.  See `Podfile` in this directory.
* See [The CocoaPod Guide](http://guides.cocoapods.org/) to learn how to use Cocoapods.
* Learning Swift and iOS development using [this tutorial](https://www.bloc.io/tutorials/swiftris-build-your-first-ios-game-with-swift#!/chapters/675).  The [Swift Language Guide](https://developer.apple.com/library/ios/documentation/Swift/Conceptual/Swift_Programming_Language/TheBasics.html#//apple_ref/doc/uid/TP40014097-CH5-XID_467) is helpful too.
* Skeleton of Connectastic iOS generated using the XCode's Page Based Application Template.
* Facebook interaction by using the Facebook iOS SDK (Objective C) via CocoaPods, and imported into Swift using a [bridging header](https://developer.apple.com/library/ios/documentation/swift/conceptual/BuildingCocoaApps/MixandMatch.html).  See `BridgingHeader.h` for implementation.  Swift code doesn't need to import anything with this header in place.
* FB SDK integration tips from http://www.brianjcoleman.com/tutorial-how-to-use-login-in-facebook-sdk-4-0-for-swift/

## Endpoints

The Endpoints client is generated. To generate the client, run:

```
  $ bin/generate_endpoints.sh
```

and follow instructions.

## Continuous Integration

We're using [GreenHouseCI](http://greenhouseci.com/index.html) for continuous testing, build and deploy of the iOS app.

### Credentials
In case you need to log in to GreenHouseCI:
* Username: `robot@connectastic.com`
* Password: `connectast1c`
 
## iTunes
iTunes account used to publish: `manik@surtani.org`. Please ask Manik for certs if you need to connect.

