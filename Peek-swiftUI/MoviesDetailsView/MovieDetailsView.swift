//
//  MovieDetailsView.swift
//  Peek-swiftUI
//
//  Created by mazen eldeeb on 26/08/2024.
//

import SwiftUI

struct MovieDetailsView: View {
    let urlString = "https://image.tmdb.org/t/p/w500/8cdWjvZQUExUUTzyp4t6EDMubfO.jpg"
    
    var body: some View {
        VStack(alignment: .leading) {
            MovieTopImage(urlString: urlString)
            HStack {
                Text("Deadpool")
                    .font(.title)
                    .bold()
                    .foregroundStyle(.white)
                Spacer()
                Image(systemName: "hand.thumbsup.fill")
                    .foregroundStyle(.lightYellow)
                    .bold()
                Text("9.1")
                    .foregroundStyle(.lightYellow)
                    .bold()
            }.padding()
            HStack {
                MovieChip(chip: "2024")
                MovieChip(chip: "Comedy")
                MovieChip(chip: "Action")
                Spacer()
                Image(systemName: "clock.fill").foregroundStyle(.gray)
                Text("1h 56m")
                    .foregroundStyle(.gray)
                
            }.padding(.horizontal)
            
            Text("About film")
                .foregroundStyle(.white)
                .font(.title2)
                .fontWeight(.semibold)
                .padding([.horizontal, .top])
                .padding(.bottom, 6)
            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin ullamcorper est ut turpis interdum eleifend. Curabitur ut quam id erat pulvinar gravida eget non dui. Sed posuere feugiat luctus. Nulla facilisi. Mauris augue erat, elementum id dolor sit amet, iaculis efficitur.")
                .lineLimit(4)
                .font(.body)
                .foregroundColor(.gray)
                .lineSpacing(2)
                .padding(.horizontal)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .ignoresSafeArea()
        .background(.mainPurple)
        
    }
}

#Preview {
    MovieDetailsView()
}
