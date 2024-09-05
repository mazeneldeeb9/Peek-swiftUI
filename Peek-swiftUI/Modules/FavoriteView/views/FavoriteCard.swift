import SwiftUI

struct FavoriteCard: View {
    let movie: Movie
    @EnvironmentObject var userFavorites: UserFavorites
    @State private var isRemoved = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .frame(height: 170)
                .foregroundStyle(.lightPurple)
                .clipShape(RoundedRectangle(cornerRadius: 20))
            
            HStack(alignment: .bottom) {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w500/\(movie.posterPath ?? "")")) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                } placeholder: {
                    ProgressView()
                        .frame(width: 150, height: 200)
                }
                .padding()
                .shadow(radius: 10)
                
                VStack(alignment: .leading) {
                    Text(movie.title ?? "N/A")
                        .lineLimit(2)
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.white)
                    StarsRatingView(rating: movie.formatVoteAverage())
                    Spacer()
                }
                .frame(height: 170)
                .padding(.top, 60)
                Spacer()
                Button(action: {
                    userFavorites.remove(movie)
                }) {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .font(.title)
                    }
                    .padding(.trailing, 25)
                    .padding(.bottom, 60)
            }
        }.onAppear {
            print(movie.formatVoteAverage())
        }
        .favoriteError(isPresented: $userFavorites.hasError, message: userFavorites.errorMessage ?? "Try again")
        .frame(height: 200)
        .padding()
    }
}
