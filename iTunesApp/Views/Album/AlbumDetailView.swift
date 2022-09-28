//
//  AlbumDetailView.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

struct AlbumDetailView: View {
    var album: Album
    
    @StateObject var songsItemsViewModel: AlbumItemsListViewModel
    
    init(album: Album) {
        self.album = album
        self._songsItemsViewModel = StateObject(wrappedValue: AlbumItemsListViewModel(albumID: album.id))
    }
    
    var body: some View {
        VStack {
            HStack(alignment: .top) {
                ImageLoadingView(urlString: album.artworkUrl100, size: 150)
                VStack(alignment: .leading) {
                    Text(album.collectionName)
                        .font(.title3)
                        .lineLimit(2)
    
                    Text(album.artistName)
                        .font(.body)
                        .foregroundColor(.secondary)
                    
                    
                    
                    HStack(alignment: .bottom) {
                        VStack(alignment: .leading) {
                            Text(album.primaryGenreName)
                            Text("\(album.trackCount) songs")
                            Text("Release: \(formattedDate(value: album.releaseDate))")
                        }
                        .font(.caption)
                        .foregroundColor(.secondary)
                         
                        Spacer()
                        
                        BuyButton(price: album.collectionPrice, currency: album.currency, urlString: album.collectionViewURL)
                    }
                    .frame(maxHeight: .infinity, alignment: .bottom)
                }
            }
            .frame(height: 150)
            .padding(.horizontal, 8)
            
            ScrollView{
                AlbumItemsListView(songsViewModel: songsItemsViewModel)
            }
           
        }
        .onAppear {
            songsItemsViewModel.fetch()
        }
        
    }
    
    func formattedDate(value: String) -> String {
        let dateFormatterGetter = DateFormatter()
        dateFormatterGetter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss'Z'"
        guard let date = dateFormatterGetter.date(from: value) else {
            return "none"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy"
        
        return dateFormatter.string(from: date)
    }
}

struct AlbumDetailView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumDetailView(album: Album.example())
    }
}
