import SwiftUI

public struct ABButtonStyle: ButtonStyle {
    var horizontalPadding: CGFloat = 14
    var verticalPadding: CGFloat = 12
    var cornerRadius: CGFloat = 8
    
    public init() {
        
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
    var backgroundColor: Color = Color.accentColor
    var horizontalPadding: CGFloat = 14
    var verticalPadding: CGFloat = 12
    
    public init() {
        
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
    var horizontalPadding: CGFloat = 14
    var verticalPadding: CGFloat = 12
    var cornerRadius: CGFloat = 8
    var borderWidth: CGFloat = 2
    
    public init() {
        
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
