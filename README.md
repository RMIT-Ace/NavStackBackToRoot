# SwiftUI Value-Based Navigation Stack

![](docs/res/navpath.png)

A look at Apple’s new value-based navigation pattern introduced in iOS 16 and macOS 13 (around 2022). This pattern replaces the `NavigationView + NavigationLink(isActive:)` pattern and offers several key advantages.

* Type-safety and clarity
* Better programmatic control
* Consistency
* Modern

```swift
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
                case .a: AView(path: $path)
                case .b: BView(path: $path)
                case .c: CView(path: $path)
                }
            }
        }
    }
}

struct AView: View {
    @Binding var path: [NavigationDestination]
    var body: some View {
        Button("B") { path.append(.b) }
        Button("Front page") { path = [] }
    }
}

struct BView: View {
    @Binding var path: [NavigationDestination]
    var body: some View {
        Button("C") { path.append(.c) }
        Button("Front page") { path = [] }
    }
}

struct CView: View {
    @Binding var path: [NavigationDestination]
    var body: some View {
        Button("Front page") { path = [] }
    }
}

```