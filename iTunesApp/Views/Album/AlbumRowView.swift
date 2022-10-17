//
//  AlbumRowView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct AlbumRowView: View {
    
    let album: Album
    
    var body: some View {
        
        HStack {
            ImageLoadingView(urlString: album.artworkUrl100, size: 100)
            VStack(alignment: .leading){
                Text(album.collectionName)
                    .foregroundColor(.fontPrimary)
                Text(album.artistName)
                    .font(.caption)
                    .foregroundColor(.fontSecondary)
                    .padding(.trailing, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .lineLimit(1)
            
            BuyButton(price: album.collectionPrice, currency: album.currency, urlString: album.collectionViewURL)
        }
    }
}

struct AlbumRowView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumRowView(album: Album.example())
            .background(Color.bg)
    }
}
