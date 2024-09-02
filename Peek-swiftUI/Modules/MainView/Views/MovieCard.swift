import SwiftUI

struct MovieCard: View {
    let movie: Movie
    let favoriteUseCase: FavoriteUseCase
    
    @State private var isFavorite: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            VStack {
                HStack {
                    Text(movie.title ?? "N/A")
                        .foregroundStyle(.white)
                        .fontWeight(.heavy)
                        .font(.title3)
                        .lineLimit(1)
                    Spacer()
                    Button(action: {
                        if isFavorite {
                            favoriteUseCase.remove(movie)
                        } else {
                            favoriteUseCase.add(movie)
                        }
                        isFavorite.toggle()
                    }) {
                        Image(systemName: isFavorite ? "heart.fill" : "heart")
                            .foregroundColor(isFavorite ? .red : .gray)
                            .font(.system(size: 24))
                    }
                    .buttonStyle(PlainButtonStyle())
                }
                .padding([.leading, .trailing], 16)
                .padding(.top, 8)
                
                HStack {
                    Image(systemName: "hand.thumbsup.fill")
                        .foregroundStyle(.lightYellow)
                        .bold()
                    Text(movie.getVoteAverage())
                        .foregroundStyle(.lightYellow)
                        .bold()
                    Spacer()
                }
                .padding([.leading, .trailing], 16)
                .padding(.bottom, 8)
            }
            .background(Color.lightPurple.opacity(0.98))
            .clipShape(
                .rect(
                    topLeadingRadius: 0,
                    bottomLeadingRadius: 16,
                    bottomTrailingRadius: 16,
                    topTrailingRadius: 0
                )
            )
        }
        .frame(width: Constants.movieCardWidth, height: Constants.movieCardHeight)
        .background(
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")) { image in
                image
                    .resizable()
                    .scaledToFill()
                    .frame(width: Constants.movieCardWidth, height: Constants.movieCardHeight)
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            } placeholder: {
                VStack {
                    ProgressView()
                    Spacer()
                }
            }
        )
        .onAppear {
            isFavorite = favoriteUseCase.contains(movie)
        }
    }
}
