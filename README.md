# **StikAppStorage**

A powerful SwiftUI property wrapper that simplifies persistent storage using `UserDefaults`. With built-in **JSON support**, `StikAppStorage` allows you to store both simple types (`String`, `Int`, `Bool`, etc.) and custom `Codable` types seamlessly.

---

## **Features**
- **Simplified Persistent Storage**: Works just like `AppStorage` but with added functionality.
- **JSON Support**: Store custom `Codable` types, like structs and enums.
- **Fallback Defaults**: Provides a fallback value if no data exists or decoding fails.
- **SwiftUI Integration**: Fully compatible with SwiftUI's reactive system.

---

## **Installation**

### Swift Package Manager

1. In Xcode, go to **File** → **Swift Packages** → **Add Package Dependency**.
2. Enter the repository URL:

   ```bash
   https://github.com/0-Blu/StikAppStorage
   ```

3. Select the latest version and add the package to your project.

---

## **Usage**

### **1. Storing Basic Types**

Easily store and retrieve simple types, like `String`, `Int`, or `Bool`:

```swift
import StikAppStorage
import SwiftUI

struct ContentView: View {
    @StikAppStorage("username") var username = "Guest"
    @StikAppStorage("isDarkMode") var isDarkMode = false

    var body: some View {
        VStack {
            Text("Hello, \(username)!")
            Toggle("Dark Mode", isOn: $isDarkMode)

            TextField("Enter your name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
        .padding()
    }
}
```

---

### **2. Storing Custom Codable Types**

You can store any custom type that conforms to `Codable`. Here's an example with a `UserProfile` struct:

```swift
import StikAppStorage
import SwiftUI

struct UserProfile: Codable {
    var name: String
    var age: Int
}

struct ContentView: View {
    @StikAppStorage("userProfile") private var userProfile = UserProfile(name: "John Doe", age: 25)
    
    var body: some View {
        VStack {
            Text("Name: \(userProfile.name)")
            Text("Age: \(userProfile.age)")
            
            Button("Update Profile") {
                $userProfile.wrappedValue = UserProfile(name: "Jane Doe", age: 30)
            }
        }
        .padding()
    }
}

```

---

### **3. Default Fallback**

If no data exists for a given key, the default value provided in `@StikAppStorage` is used:

```swift
@StikAppStorage("launchCount") var launchCount = 0
@StikAppStorage("isLoggedIn") var isLoggedIn = false
```

---

## **How It Works**

1. **Simple Types**: Stored directly into `UserDefaults`.
2. **Custom Types**: Encoded into JSON using `JSONEncoder` and saved as `Data` in `UserDefaults`.
3. **Decoding**: Automatically decoded back into the original type using `JSONDecoder`.

---

## **License**

`StikAppStorage` is available under the **MIT License**. See the LICENSE file for more details.
