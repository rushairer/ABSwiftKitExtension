import SwiftUI
#if os(iOS)
import StoreKit
#endif

public enum RoundedSize: Int, CaseIterable, Codable, Hashable, RawRepresentable  {
    case sm = 8
    case md = 12
    case lg = 16
    case xl = 24
    case xxl = 32
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
    
    #if os(iOS)
    public func listStyleInsetGroupedListStyleSafety() -> some View {
        Group {
            if #available(iOS 14.0, *) {
                self
                    .listStyle(InsetGroupedListStyle())
            } else {
                self
                    .listStyle(GroupedListStyle())
            }
        }
    }
    
    public func appStoreOverlaySafety(isPresented: Binding<Bool>, appIdentifier: String) -> some View {
        Group {
            if #available(iOS 14.0, *) {
                self.appStoreOverlay(isPresented: isPresented) {
                    SKOverlay.AppConfiguration(appIdentifier: appIdentifier, position: .bottom)
                }.self
            } else {
                self
            }
        }
    }
    #endif

}
