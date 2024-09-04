import SwiftUI

struct MovieCard: View {
    let movie: Movie
    
    @EnvironmentObject var userFavorites: UserFavorites
    
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
                        if userFavorites.contains(movie) {
                            userFavorites.remove(movie)
                        } else {
                            userFavorites.add(movie)
                        }
                    }) {
                        Image(systemName: userFavorites.contains(movie) ? "heart.fill" : "heart")
                            .foregroundColor( userFavorites.contains(movie) ? .red : .gray)
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
        
    }
}
