//
//  RouterNavigationStack.swift
//  NavigationDemo
//
//  Created by Jonathan Parker on 4/7/23.
//

import SwiftUI

public struct RouterNavigationStack<Content: View>: View {
    @StateObject private var router = Router()
    private var root: () -> Content
    
    public init(router: Router, root: @escaping () -> Content) {
        self._router = StateObject(wrappedValue: router)
        self.root = root
    }
    
    public init(root: @escaping () -> Content) {
        self.root = root
    }
    
    public var body: some View {
        NavigationStack(path: $router.path) {
            root()
                .environmentObject(router)
        }
    }
}
