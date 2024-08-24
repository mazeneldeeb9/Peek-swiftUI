import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            MainView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            FavoriteView()
                .tabItem { Label("Home", systemImage: "heart.fill") }
        }
    }
}

#Preview {
    ContentView()
}



