//
//  SongListView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI

struct SongListView: View {
    
    @ObservedObject var songListViewModel = SongListViewModel()
    
    var body: some View {
        
        List{
            ForEach(songListViewModel.songs) { song in
               SongRowView(song: song)
            }
            
            switch songListViewModel.state {
            case .start:
                Color.clear
                    .onAppear{
                        songListViewModel.loadMore()
                    }
            case .isLoading:
                ProgressView()
                    .progressViewStyle(.circular)
                    
            case .error(let message):
                Text(message)
                    .foregroundColor(.red)
                
            default:
                Color.clear
            }
        }
        .listStyle(.plain)
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(songListViewModel: SongListViewModel.example())
    }
}


