// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A property wrapper for persistent storage using UserDefaults with JSON support.
@propertyWrapper
public struct StikAppStorage<Value: Codable>: DynamicProperty {
    private let key: String
    private let defaultValue: Value
    @State private var storageValue: Value

    /// Initializes the StikAppStorage wrapper.
    public init(wrappedValue: Value, _ key: String) {
        self.key = key
        self.defaultValue = wrappedValue

        // Retrieve and decode the value from UserDefaults, or use the default.
        if let data = UserDefaults.standard.data(forKey: key),
           let decodedValue = try? JSONDecoder().decode(Value.self, from: data) {
            _storageValue = State(initialValue: decodedValue)
        } else {
            _storageValue = State(initialValue: wrappedValue)
            saveToUserDefaults(wrappedValue)
        }
    }

    /// The stored value.
    public var wrappedValue: Value {
        get { storageValue }
        set {
            storageValue = newValue
            saveToUserDefaults(newValue)
        }
    }

    /// Provides a SwiftUI Binding for compatibility.
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.storageValue },
            set: { newValue in
                self.storageValue = newValue
                self.saveToUserDefaults(newValue)
            }
        )
    }

    /// Encodes and saves the value to UserDefaults.
    private func saveToUserDefaults(_ value: Value) {
        if let encoded = try? JSONEncoder().encode(value) {
            UserDefaults.standard.set(encoded, forKey: key)
        }
    }
}
