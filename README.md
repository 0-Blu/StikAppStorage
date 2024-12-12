# **StikAppStorage (WIP)**

StikAppStorage is a work in progress simplified and lightweight SwiftUI property wrapper that makes working with persistent storage (`UserDefaults`) easier and more readable. It provides a clean, SwiftUI-compatible solution for storing and retrieving values seamlessly.

---

## **Features**
- Simplifies `AppStorage` usage with a custom property wrapper.
- Automatically persists values in `UserDefaults`.
- Compatible with SwiftUI's reactive state system.
- Supports bindings for SwiftUI views.

---

## **Installation**

### **Using Swift Package Manager**
1. In Xcode, go to **File** → **Add Packages**.
2. Enter the repository URL:
   ```
   https://github.com/0-Blu/StikAppStorage.git
   ```
3. Select the package and add it to your project.

---

## **Usage**

### **Basic Example**

Simply use `@StikAppStorage` to persist values with a key and default value.

```swift
import SwiftUI
import StikAppStorage

struct ContentView: View {
    @StikAppStorage("username") var username = "Guest"

    var body: some View {
        VStack {
            Text("Hello, \(username)!")
            TextField("Enter your name", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
        }
    }
}
```

- The value of `username` is stored in `UserDefaults` using the key `"username"`.
- Changes to `username` will automatically persist and update the UI.

---

## **Advanced Use Cases**

### **Custom Defaults**
If the key does not already exist, the default value is used until a new value is set.

```swift
@StikAppStorage("welcomeMessage") var welcomeMessage = "Welcome to StikAppStorage!"
```

---

## **Why Use StikAppStorage?**
1. Clean and declarative syntax.
2. Simplifies code for persistent storage in SwiftUI projects.
3. Reduces boilerplate for accessing `UserDefaults`.

---

## **License**

StikAppStorage is licensed under the [MIT License](LICENSE).
