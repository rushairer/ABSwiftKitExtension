import SwiftUI
import Combine

public struct ABProgressBar: View {
    @Binding var colors: [Color]
    @Binding var lineWidth: Float
    @State var running: Bool = false
    
    public init(colors: Binding<[Color]>, lineWidth: Binding<Float>, running: State<Bool> = State(initialValue: false)) {
        _colors = colors
        _lineWidth = lineWidth
        _running = running
    }
    
    public var body: some View {
        Circle()
            .trim(from: 0.02, to: 0.96)
            .stroke(AngularGradient(gradient: Gradient(colors: colors.reversed()),
                                    center: UnitPoint(x: 0.50, y: 0.50),
                                    startAngle: Angle(degrees: 0.00),
                                    endAngle: Angle(degrees: 360.00)),
                    style: StrokeStyle(lineWidth: CGFloat(lineWidth), lineCap: .round))
            .rotationEffect(.degrees(running ? 360 : 0))
            .animation(Animation
                        .linear(duration: 1)
                        .repeatForever(autoreverses: false))
            .onAppear {
                running = true
            }

    }
}
