import SwiftUI

struct MainView: View {
    @StateObject private var handler: Handler = .init()
    @State var searchText: String = ""

    var body: some View {
            if handler.isLoading {
                LoadingView()
            } else if handler.hasError {
                ErrorView(
                    callAgain: {
                        handler.loadCategories()},
                    errorMessage: handler.errorMessage ?? "Something went wrong"
                )
            } else {
                NavigationStack {
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
