import SwiftUI

struct MainView: View {
    @State var searchText: String = ""
    @StateObject private var handler: Handler = .init()
    
    var body: some View {
        ZStack {
            if handler.isLoading {
                LoadingView()
            } else if handler.hasError {
                ErrorView(callAgain: {
                    handler.fetchCategories()
                })
            } else {
                VStack(alignment: .leading, content: {
                    WelcomeBackTopView(
                        message: "Welcome Back,",
                        name: "Mazen")
                    .padding(.horizontal)
                    SearchTextField(searchText: $searchText)
                        .padding(.horizontal)
                    List(handler.categories, id: \.categoryTitle) { moviesResponse in
                        CategoryListView(category: moviesResponse)
                            .padding(.top, 16)
                            .padding(.horizontal)
                            .frame(maxWidth: .infinity)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                    }
                    .listStyle(.plain)
                    .padding(.trailing, -13)
                })
                .background(Color.mainPurple)
                .removeFocusOnTap()
            }
        }
    }
}

#Preview {
    MainView()
}
