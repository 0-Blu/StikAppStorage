# **StikAppStorage (WIP)**

<<<<<<< Updated upstream
StikAppStorage is a work in progress simplified and lightweight SwiftUI property wrapper that makes working with persistent storage (`UserDefaults`) easier and more readable. It provides a clean, SwiftUI-compatible solution for storing and retrieving values seamlessly.
=======
A lightweight SwiftUI property wrapper that simplifies persistent storage using `UserDefaults`. StikAppStorage includes built-in **JSON support** for saving and retrieving any `Codable` types, making it perfect for both simple and complex data.
>>>>>>> Stashed changes

---

## **Features**
- **Simplified AppStorage**: Easy to use with minimal code.
- **JSON Support**: Store custom `Codable` types in `UserDefaults`.
- **Default Values**: Provide a fallback if no data exists.
- **SwiftUI Compatibility**: Works seamlessly with SwiftUI bindings.

---

## **Installation**

### **Swift Package Manager**
Add the following dependency in your project:

1. Go to **Xcode** → **File** → **Swift Packages** → **Add Package Dependency**.
2. Enter the URL to your package repository.

For example:
```bash
https://github.com/0-Blu/StikAppStorage
```

---

## **Usage**

<<<<<<< Updated upstream
### **Basic Example**
=======
### **1. Basic Types**
>>>>>>> Stashed changes

Storing simple types like `String`, `Bool`, or `Int` is effortless:

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

<<<<<<< Updated upstream
## **Advanced Use Cases**
=======
### **2. Custom Codable Types**

You can store any type conforming to `Codable`:

```swift
import StikAppStorage
import SwiftUI

struct UserProfile: Codable {
    var name: String
    var age: Int
}

struct ContentView: View {
    @StikAppStorage("userProfile") var userProfile = UserProfile(name: "John Doe", age: 25)

    var body: some View {
        VStack {
            Text("Name: \(userProfile.name)")
            Text("Age: \(userProfile.age)")
            
            Button("Update Profile") {
                userProfile = UserProfile(name: "Jane Doe", age: 30)
            }
        }
        .padding()
    }
}
```

---

### **3. Default Values**
>>>>>>> Stashed changes

If no value exists in `UserDefaults`, the property will fall back to the provided default:

```swift
@StikAppStorage("isLoggedIn") var isLoggedIn = false
@StikAppStorage("launchCount") var launchCount = 0
```

---

## **How It Works**

- `StikAppStorage` automatically **encodes** and **decodes** values to/from JSON.
- Simple values (`String`, `Int`, `Bool`, etc.) are saved as-is.
- Complex types (e.g., structs) are encoded using `JSONEncoder` and stored as `Data` in `UserDefaults`.

---

## **Testing**

Unit tests ensure the property wrapper behaves as expected, including for custom types:

```swift
struct TestStruct: Codable, Equatable {
    let title: String
    let value: Int
}

@StikAppStorage("testStructKey") var testValue = TestStruct(title: "Default", value: 0)
```

---

## **Contributing**

1. Fork the repository.
2. Create a feature branch: `git checkout -b new-feature`.
3. Commit your changes: `git commit -m "Add feature"`.
4. Push to the branch: `git push origin new-feature`.
5. Open a Pull Request.

---

## **License**

StikAppStorage is licensed under the **MIT License**. See the LICENSE file for more information.
