//
//  UserDefault.swift
//  Quiz
//
//  Created by Олексій Мороз on 02.08.2025.
//

import Foundation

//MARK: UserDefault
private let userDefaultQueue = DispatchQueue(
    label: "ua.org.zoromjavadev.Quiz.UserDefaultQueue", attributes: .concurrent)
@propertyWrapper
public struct UserDefault<T> {

    private let key: String
    private let defaultValue: T

    public var wrappedValue: T {
        get {
            let key = self.key
            let defaultValue = self.defaultValue

            return userDefaultQueue.sync {
                UserDefaults.standard.object(forKey: key) as? T ?? defaultValue
            }
        }
        set {
            let key = self.key

            userDefaultQueue.async(flags: .barrier) {
                UserDefaults.standard.set(newValue, forKey: key)
                UserDefaults.standard.synchronize()
            }
        }
    }

    public init(_ key: Constants.UserDefaultKey, defaultValue: T) {
        self.key = key.rawValue
        self.defaultValue = defaultValue
    }
}

//MARK: UserDefault
private let optionalUserDefaultQueue = DispatchQueue(
    label: "ua.org.zoromjavadev.Quiz.OptionalUserDefaultQueue", attributes: .concurrent)
@propertyWrapper
public struct OptionalUserDefault<T> {
    
    private let key: String

    public var wrappedValue: T? {
        get {
            let key = self.key
            return optionalUserDefaultQueue.sync {
                UserDefaults.standard.object(forKey: key) as? T
            }
        }
        set {
            let key = self.key
            optionalUserDefaultQueue.async(flags: .barrier) {
                if let newValue = newValue {
                    UserDefaults.standard.set(newValue, forKey: key)
                } else {
                    UserDefaults.standard.removeObject(forKey: key)
                }
                UserDefaults.standard.synchronize()
            }
        }
    }

    public init(_ key: Constants.UserDefaultKey) {
        self.key = key.rawValue
    }
}
