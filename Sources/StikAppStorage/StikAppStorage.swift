// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A simplified AppStorage property wrapper with JSON and custom type support.
@propertyWrapper
public struct StikAppStorage<Value: Codable>: DynamicProperty {
    private let key: String
    private let defaultValue: Value
    @State private var storageValue: Value

    /// Initializes StikAppStorage with a key and a default value.
    /// - Parameters:
    ///   - wrappedValue: Default value when no data exists for the key.
    ///   - key: The key to store the value in UserDefaults.
    public init(wrappedValue: Value, _ key: String) {
        self.key = key
        self.defaultValue = wrappedValue
        if let data = UserDefaults.standard.data(forKey: key),
           let decodedValue = try? JSONDecoder().decode(Value.self, from: data) {
            self._storageValue = State(initialValue: decodedValue)
        } else {
            self._storageValue = State(initialValue: wrappedValue)
            saveToUserDefaults(wrappedValue)
        }
    }

    /// Accesses the stored value.
    public var wrappedValue: Value {
        get { storageValue }
        set {
            storageValue = newValue
            saveToUserDefaults(newValue)
        }
    }
    
    /// Provides a binding for SwiftUI compatibility.
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.storageValue },
            set: { newValue in
                self.storageValue = newValue
                self.saveToUserDefaults(newValue)
            }
        )
    }
    
    /// Saves the value to UserDefaults, encoding it to JSON.
    private func saveToUserDefaults(_ value: Value) {
        if let encoded = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
