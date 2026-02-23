//
//  ContentView.swift
//  NavigationStackDemo
//
//  Created by ace on 24/2/2025.
//

import SwiftUI

enum NavigationDestination: Hashable {
    case a
    case b
    case c
}

struct ContentView: View {
    @State private var path: [NavigationDestination] = []
    var body: some View {
        NavigationStack(path: $path) {
            VStack {
                Button("A") { path.append(.a) }
            }
            .padding()
            .navigationDestination(for: NavigationDestination.self) { destination in
                switch destination {
                case .a:
                    AView(path: $path)
                case .b:
                    BView(path: $path)
                case .c:
                    CView(path: $path)
                }
            }
        }
    }
}

struct AView: View {
    @Binding var path: [NavigationDestination]
    var body: some View {
        Button("B") { path.append(.b) }
    }
}

struct BView: View {
    @Binding var path: [NavigationDestination]
    var body: some View {
        Button("C") { path.append(.c) }
    }
}

struct CView: View {
    @Binding var path: [NavigationDestination]
    var body: some View {
        Button("Front page") { path = [] }
    }
}

#Preview {
    ContentView()
}
