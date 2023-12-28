import UIKit
import Flutter
import GoogleMaps


@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
     GMSServices.provideAPIKey("AIzaSyA7P_lV0PiSidBsSHkl0HxFgVp9W7Ho9C0")
    GeneratedPluginRegistrant.register(with: self)
  
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
