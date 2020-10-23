# ABSwiftKitExtension

A description of this package.


``` swift

import SwiftUI
import ABSwiftKitExtension

struct ContentView: View {
    var body: some View {
        NavigationView {
            List {
                TagView(title: "UIScreen.main.nativeBounds.height: \(Int(UIScreen.main.nativeBounds.height))", backgroundColor: .blue)
                
                TagView(title: "Has Top Notch", backgroundColor: .green)
                    .modifier(HiddenModifier(isHidden: !UIDevice.current.hasTopNotch, remove: true))
                
                TagView(title: "Do Not Has Top Notch", backgroundColor: .red)
                    .modifier(HiddenModifier(isHidden: UIDevice.current.hasTopNotch, remove: true))
            }
            .navigationBarTitle("Example")
        }
    }
}

struct TagView: View {
    var title: String
    var backgroundColor: Color
    var body: some View {
        Text(self.title)
            .font(.caption)
            .padding(8)
            .background(self.backgroundColor)
            .clipRounded(.sm)
            .opacityShadow()
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewDisplayName("iPhone 12 Mini")
                .previewDevice("iPhone 12 Mini")
            ContentView()
                .previewDisplayName("iPhone 12")
                .previewDevice("iPhone 12")
            ContentView()
                .previewDisplayName("iPhone 12 Pro")
                .previewDevice("iPhone 12 Pro")
            ContentView()
                .previewDisplayName("iPhone 12 Pro Max")
                .previewDevice("iPhone 12 Pro Max")
            ContentView()
                .previewDisplayName("iPhone 8 Plus")
                .previewDevice("iPhone 8 Plus")
        }
    }
}


```
