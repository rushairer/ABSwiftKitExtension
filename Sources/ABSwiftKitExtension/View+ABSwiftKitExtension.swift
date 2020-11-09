import SwiftUI
#if os(iOS)
import StoreKit
#endif

public enum RoundedSize: Float, CaseIterable, Codable, Hashable, RawRepresentable  {
    case sm = 8.0
    case md = 12.0
    case lg = 16.0
    case xl = 24.0
    case xxl = 32.0
    func value(value: Float) -> Float {
        return value
    }
}

extension View {
    public func opacityShadow() -> some View {
        self
            .shadow(color: Color.black.opacity(0.25),
                    radius: 10,
                    x: 0,
                    y: 5)
    }
    
    public func clipRounded(_ size: RoundedSize = .md) -> some View {
        self
            .clipShape(RoundedRectangle(cornerRadius: CGFloat(size.rawValue),
                                        style: .continuous))
    }
    
    @ViewBuilder public func `if`<Transform: View>(_ condition: Bool, transform: (Self) -> Transform) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
    
    @ViewBuilder public func `if`<TrueContent: View, FalseContent: View>(_ condition: Bool, if ifTransform: (Self) -> TrueContent, else elseTransform: (Self) -> FalseContent) -> some View {
        if condition {
            ifTransform(self)
        } else {
            elseTransform(self)
        }
    }
    
    @ViewBuilder func ifLet<V, Transform: View>(_ value: V?, transform: (Self, V) -> Transform) -> some View {
        if let value = value {
            transform(self, value)
        } else {
            self
        }
    }
    
    @available(iOS, introduced: 13, deprecated: 14, message: "Use .ignoresSafeArea(.keyboard) directly")
    @ViewBuilder func ignoreKeyboard() -> some View {
        if #available(iOS 14.0, watchOS 7.0, macOS 11.0, *) {
            ignoresSafeArea(.keyboard)
        } else {
            self // iOS 13 always ignores the keyboard
        }
    }
    
    #if os(iOS)
    @available(iOS, introduced: 13, deprecated: 14, message: "Use .listStyle(InsetGroupedListStyle()) directly")
    @ViewBuilder public func listStyleInsetGroupedListStyleDirectly() -> some View {
        if #available(iOS 14.0, *) {
            self
                .listStyle(InsetGroupedListStyle())
        } else {
            self
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
        }
    }
    
    @available(iOS, introduced: 13, deprecated: 14, message: "Use appStoreOverlay(isPresented:appIdentifier) directly")
    @ViewBuilder public func appStoreOverlayDirectly(isPresented: Binding<Bool>, appIdentifier: String? = nil) -> some View {
        if #available(iOS 14.0, *) {
            self.appStoreOverlay(isPresented: isPresented) {
                appIdentifier == nil ? SKOverlay.AppClipConfiguration(position: .bottom) : SKOverlay.AppConfiguration(appIdentifier: appIdentifier!, position: .bottom)
            }.self
        } else {
            self
        }
        
    }
    #endif
    
}
