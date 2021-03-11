//
//  ContentView.swift
//  ABSwiftKitExtensionExample-iOS
//
//  Created by Abenx on 2021/3/11.
//

import SwiftUI
import ABSwiftKitExtension

struct ContentView: View {
    
    var avatar: some View {
        HStack {
            ABWebImage(url: URL(string: "https://avatars.githubusercontent.com/u/5195693")!)
                .frame(width: 120, height: 120, alignment: .center)
        }
    }
    
    var body: some View {
        List {
            HStack {
                avatar
                    .clipRounded(.lg)
                
                ZStack {
                    LinearGradient(
                        gradient: Gradient(colors: [.red, .blue]),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing
                    )
                    
                    ABVisualEffectBlur(blurStyle: .dark, vibrancyStyle: .label) {
                        ABProgressBar(colors: .constant([.pink, Color.yellow.opacity(0.6), Color.yellow.opacity(0.1)]),
                                      lineWidth: .constant(2.0))
                            .frame(width: 80, height: 80, alignment: .center)
                            .padding(20)
                    }
                    
                }
                .frame(width: 120, height: 120, alignment: .center)
                .clipRounded(.lg)
            }
            
            ZStack {
                LinearGradient(
                    gradient: Gradient(colors: [.red, .blue]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                
                ABVisualEffectBlur(blurStyle: .systemUltraThinMaterial, vibrancyStyle: .fill) {
                    Text("Hello World!")
                        .frame(width: 200, height: 100)
                }
            }
            .clipRounded()
            
            TagView(title: "UIScreen.main.nativeBounds.height: \(Int(UIScreen.main.nativeBounds.height))", backgroundColor: .blue)
            
            TagView(title: "Has Top Notch", backgroundColor: .green)
                .modifier(HiddenModifier(isHidden: !UIDevice.current.hasTopNotch, remove: true))
            
            TagView(title: "Do Not Has Top Notch", backgroundColor: .red)
                .modifier(HiddenModifier(isHidden: UIDevice.current.hasTopNotch, remove: true))
            
            Button("ABButtonStyle") {
                
            }
            .buttonStyle(ABButtonStyle())
            
            Button("ABButtonStyle") {
                
            }
            .buttonStyle(ABButtonStyle(cornerRadius: 0))
            .accentColor(.red)
            
            Button("ABListButtonStyle") {
            }
            .buttonStyle(ABListButtonStyle())
            
            Button("ABBorderButtonStyle") {
                
            }
            .buttonStyle(ABBorderButtonStyle())
            
            Button("ABListButtonStyle") {
                
            }
            .buttonStyle(ABListButtonStyle())
        }
        .listStyleInsetGroupedListStyleDirectly()
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
