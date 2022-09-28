//
//  MovieSectionView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct MovieSectionView: View {
    
    let movies: [Movie]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(movies){ movie in
                    VStack {
                        ImageLoadingView(urlString: movie.artworkUrl100, size: 120)
                        Text(movie.trackName)
                    }
                    .lineLimit(2)
                    .frame(width: 100)
                }
            }
        }
    }
}

struct MovieSectionView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSectionView(movies: Array(repeating: Movie.example(), count: 10))
    }
}
