import SwiftUI

public struct HiddenModifier: ViewModifier {
    private let isHidden: Bool
    private let remove: Bool
    
    public init(isHidden: Bool, remove: Bool = false) {
        self.isHidden = isHidden
        self.remove = remove
    }
    
    public func body(content: Content) -> some View {
        Group {
            if isHidden {
                if remove {
                    EmptyView()
                } else {
                    content.hidden()
                }
            } else {
                content
            }
        }
    }
}
