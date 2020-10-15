import SwiftUI

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
}
