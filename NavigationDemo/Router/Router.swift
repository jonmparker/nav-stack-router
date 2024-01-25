//
//  Router.swift
//  NavigationDemo
//
//  Created by Jonathan Parker on 4/7/23.
//

import SwiftUI

/// Maintains the navigation path and handles navigation operations.
public final class Router: ObservableObject {
    /// The current navigation stack.
    @Published var path = NavigationPath()
    /// Identifier used to display a sheet in the current context.
    @Published var sheetItem: CoverItem?
    /// Identifier used to display a coer in the current context.
    @Published var coverItem: CoverItem?
}

// MARK: Push Operations
extension Router {
    /// Adds a new `Hashable` to the navigation stack (forward navigation)
    /// - Parameter item: A `Hashable` identifier to be added to the stack
    public func push<Item: Hashable>(_ item: Item) {
        path.append(item)
    }
    
    /// Adds a group of `Hashable`s to the navigation stack (forward navigation)
    /// - Parameter items: An array containing `Hashable` identifiers to be added to the stack
    public func push<Item: Hashable>(_ items: [Item]) {
        items.forEach { item in
            path.append(item)
        }
    }
}

// MARK: Pop Operations
extension Router {
    
    /// Removes a given number of `Hashable`s from the navigation stack (back navigation).
    /// - Parameter numberToPop: The amount of `Hashable` identifiers to be removed. Defaults to 1.
    public func pop(_ numberToPop: Int = 1) {
        path.removeLast(numberToPop)
    }
    
    /// Removes all items from the navigation stack and returns to the root view.
    public func popToRoot() {
        path = .init()
    }
}

/// A `Hashable`, `Identifiable` identifier used to display cover or sheet items.
public enum CoverItem: Hashable, Identifiable {
    case sheet
    case coverage
    
    public var id: String {
        String(describing: self)
    }
}
