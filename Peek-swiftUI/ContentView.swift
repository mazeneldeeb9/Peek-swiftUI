import SwiftUI

struct ContentView: View {
    init() {
        UITabBar.appearance().backgroundColor = .mainPurple
        
    }
    var body: some View {
        
        TabView {
            MainView()
                .tabItem { Label("Home", systemImage: "house.fill") }
            FavoriteView()
                .tabItem { Label("Favourite", systemImage: "heart.fill") }
        }.toolbarBackground(.mainPurple, for: .tabBar)
            .tint(.brightPurple)
        
            .onAppear{           UITabBar.appearance().unselectedItemTintColor =   .inactiveGrey
            }
        
        
    }
}

#Preview {
    ContentView()
}



