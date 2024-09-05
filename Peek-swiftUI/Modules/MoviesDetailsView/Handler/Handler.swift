import SwiftUI
import Combine

extension MoviesDetailsView {
    @MainActor
    class Handler: ObservableObject {
        @Published var movie: Movie?
        @Published var isLoading: Bool = false
        @Published var hasError: Bool = false
        @Published var errorMessage: String?

        let movieUsecase: MoviesUsecase
        private var cancellables = Set<AnyCancellable>()

        init(movieId: Int, moviesUsecase: MoviesUsecase = MoviesUsecase()) {
            self.movieUsecase = moviesUsecase
            fetchMovieDetails(for: movieId)
        }

        func fetchMovieDetails(for movieId: Int) {
            isLoading = true
            hasError = false
            movieUsecase.fetchMovieDetails(of: movieId)
                .sink { [weak self] completion in
                    self?.isLoading = false
                    switch completion {
                    case .failure(let error):
                        self?.hasError = true
                        self?.errorMessage = error.localizedDescription
                        print(error)
                    case .finished:
                        break
                    }
                } receiveValue: { [weak self] movie in
                    self?.movie = movie
                }
                .store(in: &cancellables)
        }
    }
}
