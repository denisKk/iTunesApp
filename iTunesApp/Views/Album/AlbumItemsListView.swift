//
//  AlbumItemsListView.swift
//  iTunesApp
//
//  Created by Dev on 23.09.22.
//

import SwiftUI

struct AlbumItemsListView: View {
    
    @ObservedObject var songsViewModel: AlbumItemsListViewModel
    
    var body: some View {
        
        VStack {
            
            ForEach(songsViewModel.songs){ song in
                
                HStack {
                    Text("\(song.trackNumber)")
                        .font(.caption)
                        .frame(width: 30)
                    Text(song.trackName)
                        .font(.body.weight(.bold))
                    Spacer()
                    Text(formattedDuration(time:song.trackTimeMillis))
                        .font(.caption)
                    
                    if let price = song.trackPrice {
                        BuyButton(price: price, currency: song.currency, urlString: song.previewURL)
                    }
                    else {
                        Text("album only")
                    }
                    
                }
                Divider()
            }
        }
        .padding()
    }
    
    func formattedDuration(time: Int) -> String {
        
        let timeInSeconds = time / 1000
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        return formatter.string(from: interval) ?? ""
        
    }
}

struct AlbumItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumItemsListView(songsViewModel: AlbumItemsListViewModel.example())
    }
}
