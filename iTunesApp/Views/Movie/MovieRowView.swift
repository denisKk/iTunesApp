//
//  MovieRowView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct MovieRowView: View {
    let movie: Movie
    
    var body: some View {
        
        HStack {
            ImageLoadingView(urlString: movie.artworkUrl100, size: 100)
            VStack(alignment: .leading){
                Text(movie.trackName)
                Text(movie.artistName)
                    .font(.caption)
                    .foregroundColor(.secondary)
                    .padding(.trailing, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .lineLimit(1)
            
            BuyButton(price: movie.trackPrice, currency: movie.currency, urlString: movie.trackViewURL)
        }
        
    }
}

struct MovieRowView_Previews: PreviewProvider {
    static var previews: some View {
        MovieRowView(movie: Movie.example())
    }
}
