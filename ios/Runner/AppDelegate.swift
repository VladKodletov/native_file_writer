import Flutter
import UIKit

@main
@objc class AppDelegate: FlutterAppDelegate {
    private let channelName = "com.example.native_file_writer/file_channel"
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
                guard let content = call.arguments as? String else {
                    result(FlutterError(code: "INVALID_ARGUMENTS",
                                      message: "Expected string content",
                                      details: nil))
                    return
                }
                
                let success = self.fileWriter.writeToFile(withContent: content)
                result(success)
                
            case "readFromFile":
                let content = self.fileWriter.readFromFile()
                result(content)
                
            default:
                result(FlutterMethodNotImplemented)
            }
        }
        
        GeneratedPluginRegistrant.register(with: self)
        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}
