// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

/// A simplified AppStorage property wrapper to make persistent storage easier.
@propertyWrapper
public struct StikAppStorage<Value>: DynamicProperty {
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
        self._storageValue = State(initialValue: UserDefaults.standard.object(forKey: key) as? Value ?? wrappedValue)
    }
    
    /// Accesses the stored value.
    public var wrappedValue: Value {
        get { storageValue }
        set {
            storageValue = newValue
            UserDefaults.standard.set(newValue, forKey: key)
        }
    }
    
    /// Provides a binding for SwiftUI compatibility.
    public var projectedValue: Binding<Value> {
        Binding(
            get: { self.storageValue },
            set: { newValue in
                self.storageValue = newValue
                UserDefaults.standard.set(newValue, forKey: self.key)
            }
        )
    }
}
