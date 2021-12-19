import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {

    GMSServices.provideAPIKey("AIzaSyAOqirTP4K2Wzl8441Q48JIy5vEVJqdYKc")
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
