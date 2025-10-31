```markdown
# Native File Writer App

A Flutter application with native iOS integration that demonstrates writing to files using Swift and MethodChannel. The app features a simple counter that writes "hello world N" to a text file with each button press.

## 📱 Demo

### Initial State
![initial_state](https://github.com/user-attachments/assets/38ff8d2d-7ddc-45cc-b35f-55c924b297ea)

### After Multiple Clicks  
![working_state](https://github.com/user-attachments/assets/e786e2f8-ade3-451e-983d-71700c5b6848)


## 🚀 Features

- **Native iOS Integration**: Uses MethodChannel to communicate with Swift code
- **File Operations**: Writes and reads from text files using native iOS APIs
- **Real-time Updates**: Displays file content immediately after each write operation
- **Clean Architecture**: Built with BLoC state management and feature-first structure
- **Error Handling**: Robust error handling for file operations

## 🛠️ Installation & Setup

### Prerequisites

- Flutter 3.0 or higher
- Xcode 15.0 or higher (for iOS builds)
- iOS Simulator or physical iOS device

### Quick Start

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/native-file-writer.git
   cd native-file-writer
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Setup iOS dependencies**
   ```bash
   cd ios
   pod install
   cd ..
   ```

4. **Run the application**
   ```bash
   flutter run
   ```

## 🎯 How to Use

1. **Launch the App**: Open the app to see the initial screen with counter at 0
2. **Press the Button**: Tap "Write to File (N=0)" to increment the counter
3. **View Results**: Watch as:
   - Counter increases (N=1, N=2, N=3...)
   - File content updates in real-time
   - "hello world N" lines accumulate in the display
4. **Continue Writing**: Each press adds a new line to the file
