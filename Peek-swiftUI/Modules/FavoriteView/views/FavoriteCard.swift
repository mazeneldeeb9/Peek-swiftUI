import SwiftUI

struct FavoriteCard: View {
    let movie: Movie
    @State private var isFavorite = true
    var body: some View {
        ZStack {
            Rectangle().frame(
                width: .infinity, height: 170)
            .foregroundStyle(.lightPurple)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            HStack(alignment: .bottom) {
                AsyncImage(url: URL(string: movie.posterPath!)) { image in
                    image
                        .resizable()
                        .scaledToFill()
                        .frame(width: 150, height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 16))
                }  placeholder: {
                    ProgressView().frame(width: 150)
                    
                }.padding()
                    .shadow(radius: 10)
                VStack {
                    Text(movie.title ?? "N/A")
                        .lineLimit(/*@START_MENU_TOKEN@*/2/*@END_MENU_TOKEN@*/)
                        .bold()
                        .font(.title2)
                        .foregroundStyle(.white)
                    StarsRatingView(rating: movie.voteAverage ?? 0.0)
                    Spacer()
                }.frame(height: 170)
                    .padding(.top, 60)
                Spacer()
                Button(action: {
                    isFavorite.toggle()
                }, label: {
                    Image(systemName: isFavorite ? "heart.fill" : "heart")
                        .foregroundStyle(.red)
                        .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                }).padding(.trailing, 25)
                    .padding(.bottom, 60)
            }
        }
        .frame(width: .infinity, height: 200)
        .padding()
    }
}
