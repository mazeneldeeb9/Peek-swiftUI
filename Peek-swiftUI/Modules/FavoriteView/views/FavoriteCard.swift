import SwiftUI

struct FavoriteCard: View {
    let movie: Movie
    
    @EnvironmentObject var favoritesHandler: FavoritesHandler
    @State private var isRemoved: Bool = false
    
    var body: some View {
        if !isRemoved {
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
                        
                        StarsRatingView(rating: movie.voteAverage ?? 0.0)
                        
                        Spacer()
                    }
                    .frame(height: 170)
                    .padding(.top, 60)
                    
                    Spacer()
                    
                    Button(action: {
                        withAnimation(.easeOut(duration: 0.3)) {
                            isRemoved = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                                favoritesHandler.remove(movie)
                            }
                        }
                    }) {
                        Image(systemName: "heart.fill")
                            .foregroundStyle(.red)
                            .font(.title)
                    }
                    .padding(.trailing, 25)
                    .padding(.bottom, 60)
                }
            }
            .favoriteError(isPresented: $favoritesHandler.hasError, message: favoritesHandler.errorMessage ?? "try again")
            .frame(height: 200)
            .padding()
        }
    }
}
