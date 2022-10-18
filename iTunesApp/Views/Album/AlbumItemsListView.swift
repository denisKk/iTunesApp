//
//  AlbumItemsListView.swift
//  iTunesApp
//
//  Created by Dev on 23.09.22.
//

import SwiftUI

struct AlbumItemsListView: View {
    
    @StateObject var songsViewModel: AlbumItemsListViewModel
    let selectedSong: Song?
 
    var body: some View {

        VStack {
            ScrollView {
                LazyVStack{
                    ForEach(songsViewModel.songs.sorted(by: {$0.trackNumber < $1.trackNumber})){ song in
                        
                        HStack {
                            Text("\(song.trackNumber)")
                                .font(.caption)
                                .fontWeight(selectedSong == song ? .bold : .regular)
                                .frame(width: 30)
                                .foregroundColor(.fontSecondary)
                                
                            Text(song.trackName)
                                .font(.body)
                                .foregroundColor(selectedSong == song ? Color.main : .fontPrimary)
                                .fontWeight(selectedSong == song ? .bold : .regular)
                            Spacer()
                            Text(formattedDuration(time:song.trackTimeMillis))
                                .font(.caption)
                                .foregroundColor(.fontSecondary)
                                .fontWeight(selectedSong == song ? .bold : .regular)
                            
                            if let price = song.trackPrice {
                                BuyButton(price: price, currency: song.currency, urlString: song.previewURL)
                            }
                            else {
                                Text("album only".localizedUppercase)
                                    .font(.caption)
                                    .foregroundColor(.fontPrimary)
                            }
                            
                        }
                        .id(song.id)
                        
                        Divider()
                            .background(Color.fontSecondary)
                    }
                }
            }
            .padding(.horizontal)
        .background(Color.bg)
        }
    }
    
    func formattedDuration(time: Int) -> String {
        
        let timeInSeconds = time / 1000
        let interval = TimeInterval(timeInSeconds)
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.minute, .second]
        formatter.unitsStyle = .positional
        formatter.zeroFormattingBehavior = .pad
        return formatter.string(from: interval) ?? ""
        
    }
}

struct AlbumItemsListView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumItemsListView(songsViewModel: AlbumItemsListViewModel.example(), selectedSong: nil)
    }
}
