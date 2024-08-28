import SwiftUI

struct MainView: View {
    @State var searchText: String = ""
    @StateObject private var handler: Handler = .init()
    
    var body: some View {
        Group {
            if handler.isLoading {
                LoadingView()
            } else if handler.hasError {
                ErrorView(
                    callAgain: {
                        handler.fetchCategories()},
                    errorMessage: handler.errorMessage ?? "Something went wrong"
                )
            } else {
                VStack(alignment: .leading) {
                    WelcomeBackTopView(
                        message: "Welcome Back,",
                        name: "Mazen"
                    )
                    
                    SearchTextField(searchText: $searchText)
                    List(handler.categories, id: \.categoryTitle) { moviesResponse in
                        CategoryListView(category: moviesResponse)
                            .padding(.top, 16)
                            .frame(maxWidth: .infinity)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                    }
                    .padding(.trailing, -13)
                    .listStyle(.plain)
                }
                .padding()
                .background(Color.mainPurple)
                .removeFocusOnTap()
            }
            
        }
    }
}

#Preview {
    MainView()
}
