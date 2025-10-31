import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let channelName = "native_file_writer"
    private let fileWriter = NativeFileWriter()
    
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        let controller = window?.rootViewController as! FlutterViewController
        let channel = FlutterMethodChannel(
            name: channelName,
            binaryMessenger: controller.binaryMessenger
        )
        
        channel.setMethodCallHandler { [weak self] call, result in
            guard let self = self else { return }
            
            switch call.method {
            case "writeToFile":
                guard let args = call.arguments as? [String: Any],
                      let counter = args["counter"] as? Int else {
                    result(FlutterError(code: "INVALID_ARGUMENTS",
                                      message: "Expected counter argument",
                                      details: nil))
                    return
                }
                
                let content = "hello world \(counter)"
                if self.fileWriter.writeToFile(withContent: content) {
                    // After successful write, read and return the content
                    let fileContent = self.fileWriter.readFromFile()
                    result(fileContent)
                } else {
                    result(FlutterError(code: "WRITE_ERROR",
                                      message: "Failed to write to file",
                                      details: nil))
                }
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
