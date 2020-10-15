//
//  ContentView.swift
//  ABSwiftKitExtensionExample
//
//  Created by Abenx on 2020/10/16.
//

import SwiftUI
import ABSwiftKitExtension

struct ContentView: View {
    var body: some View {
        Text("Hello, world!")
            .padding()
            .background(Color.pink)
            .clipRounded(.xl)
            .opacityShadow()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
