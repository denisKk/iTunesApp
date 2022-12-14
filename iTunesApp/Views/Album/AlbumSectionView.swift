//
//  AlbumSectionView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct AlbumSectionView: View {
    let albums: [Album]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(alignment: .top) {
                ForEach(albums){ album in
                    VStack (alignment: .leading){
                        ImageLoadingView(urlString: album.artworkUrl100, size: 100)
                        Text(album.collectionName)
                            .font(.footnote)
                        Text(album.artistName)
                            .font(.caption)
                            .foregroundColor(.fontSecondary)
                    }
                    .lineLimit(2)
                    .frame(width: 100)
                    .font(.caption)
                }
            }
            .padding(.bottom, 8)
        }
    }
}

struct AlbumSectionView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSectionView(albums: Array(repeating: Album.example(), count: 10))
    }
}
