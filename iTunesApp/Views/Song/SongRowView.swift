//
//  SongRowView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct SongRowView: View {
    
    var song: Song
    
    var body: some View {
        HStack {
            ImageLoadingView(urlString: song.artworkUrl60, size: 60)
            
            VStack(alignment: .leading) {
                Text(song.trackName)
                    .font(.footnote)
                    .foregroundColor(.fontPrimary)
                Text("\(song.artistName) - \(song.collectionName)")
                    .font(.caption)
                    .foregroundColor(.fontSecondary)
                    .padding(.trailing, 16)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .lineLimit(1)
            
            BuyButton(price: song.trackPrice, currency: song.currency, urlString: song.previewURL)

        }
    }
}


struct SongRowView_Previews: PreviewProvider {
    static var previews: some View {
        SongRowView(song: Song.example())
    }
}
