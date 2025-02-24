//
//  ContentView.swift
//  NavigationStackDemo
//
//  Created by ace on 24/2/2025.
//

import SwiftUI

struct ContentView: View {
    @State var isActive : Bool = false
    var body: some View {
        NavigationView {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
                NavigationLink("A", isActive: $isActive) {
                    AView(rootIsActive: $isActive)
                }
            }
            .padding()
        }
    }
}

struct AView: View {
    @Binding var rootIsActive : Bool
    var body: some View {
        NavigationLink("B") {
            BView(rootIsActive: $rootIsActive)
        }
    }
}

struct BView: View {
    @Binding var rootIsActive : Bool
    var body: some View {
        NavigationLink("C") {
            CView(rootIsActive: $rootIsActive)
        }
    }
}

struct CView: View {
    @Binding var rootIsActive : Bool
    var body: some View {
        Button("Front page") {
            rootIsActive = false
        }
    }
}

#Preview {
    ContentView()
}
