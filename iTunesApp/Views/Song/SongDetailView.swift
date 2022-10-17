//
//  SongDetailView.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

import SwiftUI

struct SongDetailView: View {
    
    let song: Song
    
    @StateObject var songsItemsViewModel: AlbumItemsListViewModel
    @StateObject var albumViewModel = AlbumForSongViewModel()
    
    init(song: Song) {
        self.song = song
        self._songsItemsViewModel = StateObject(wrappedValue: AlbumItemsListViewModel(albumID: song.collectionID))
    }
    
    var body: some View {
        VStack() {
            
            if let album = albumViewModel.album {
                AlbumHaderDetailView(album: album)
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
                    .onAppear {
                        albumViewModel.feach(song: song)
                        songsItemsViewModel.fetch()
                    }
            }
            
            ScrollViewReader { proxy in
                    
                    if songsItemsViewModel.state == .isLoading {
                        ProgressView()
                            .progressViewStyle(.circular)
                    } else if songsItemsViewModel.songs.count > 0 {
                        AlbumItemsListView(songsViewModel: songsItemsViewModel, selectedSong: song)
                            .onAppear{
                                proxy.scrollTo(song.trackNumber, anchor: .center)
                            }
                    }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.bg)
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song.example())
    }
}
