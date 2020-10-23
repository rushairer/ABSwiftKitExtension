//
//  File.swift
//  
//
//  Created by Abenx on 2020/10/23.
//

import SwiftUI

public struct PhoneOnlyModifier: ViewModifier {
    public func body(content: Content) -> some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .phone {
                content
            } else {
                EmptyView()
            }
        }
    }
}

public struct PadOnlyModifier: ViewModifier {
    public func body(content: Content) -> some View {
        Group {
            if UIDevice.current.userInterfaceIdiom == .pad {
                content
            } else {
                EmptyView()
            }
        }
    }
}

public struct TopNotchOnlyModifier: ViewModifier {
    public func body(content: Content) -> some View {
        Group {
            if UIDevice.current.hasTopNotch {
                content
            } else {
                EmptyView()
            }
        }
    }
}

public struct NotTopNotchOnlyModifier: ViewModifier {
    public func body(content: Content) -> some View {
        Group {
            if !UIDevice.current.hasTopNotch {
                content
            } else {
                EmptyView()
            }
        }
    }
}

public struct EdgesIgnoringSafeAreaModifier: ViewModifier {
    private let edges: Edge.Set
    private let ignoring: Bool
    
    public init(_ edges: Edge.Set, ignoring: Bool = false) {
        self.edges = edges
        self.ignoring = ignoring
    }
    
    public func body(content: Content) -> some View {
        Group {
            if self.ignoring {
                content
            } else {
                content
                    .edgesIgnoringSafeArea(self.edges)
            }
        }
    }
}
