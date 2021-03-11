import SwiftUI

public struct ABButtonStyle: ButtonStyle {
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    var cornerRadius: CGFloat
    
    public init(horizontalPadding: CGFloat = 14, verticalPadding: CGFloat = 12, cornerRadius: CGFloat = 8) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.cornerRadius = cornerRadius
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(RoundedRectangle(cornerRadius: cornerRadius).fill(Color.accentColor))
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
    }
}

public struct ABListButtonStyle: ButtonStyle {
    var backgroundColor: Color
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    
    public init(backgroundColor: Color = Color.accentColor, horizontalPadding: CGFloat = 14, verticalPadding: CGFloat = 12) {
        self.backgroundColor = backgroundColor
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity)
            .font(.headline)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : Color.white)
            .listRowBackground(configuration.isPressed ? Color.accentColor.opacity(0.5) : Color.accentColor)
            .background(Color.accentColor)
    }
}

public struct ABBorderButtonStyle: ButtonStyle {
    var horizontalPadding: CGFloat
    var verticalPadding: CGFloat
    var cornerRadius: CGFloat
    var borderWidth: CGFloat
    
    public init(horizontalPadding: CGFloat = 14, verticalPadding: CGFloat = 12, cornerRadius: CGFloat = 8, borderWidth: CGFloat = 2) {
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
    }
    
    public func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .font(.headline)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(RoundedRectangle(cornerRadius: cornerRadius).stroke(Color.accentColor, lineWidth: borderWidth))
            .background(Color.white.opacity(0.01))
            .foregroundColor(configuration.isPressed ? Color.accentColor.opacity(0.5) : Color.accentColor)
    }
}
