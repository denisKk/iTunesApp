//
//  SearchAllListView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI

struct SearchAllListView: View {
    
    @ObservedObject var albumListViewModel: AlbumListViewModel
    @ObservedObject var songsListViewModel: SongListViewModel
    @ObservedObject var movieListViewModel: MovieListViewModel
    
    var body: some View {
        ScrollView {
            LazyVStack {
                
                HStack {
                    Text("Songs")
                    Spacer()
                    NavigationLink  {
                        SongListView(songListViewModel: songsListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                
                SongSectionView(songs: songsListViewModel.songs)
                
                Divider()
                
                HStack {
                    Text("Albums")
                    Spacer()
                    NavigationLink  {
                        AlbumListView(albumListViewModel: albumListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                
                AlbumSectionView(albums: albumListViewModel.albums)
                
                Divider()
                
                HStack {
                    Text("Movies")
                    Spacer()
                    NavigationLink  {
                        MovieListView(movieListViewModel: movieListViewModel)
                    } label: {
                        HStack {
                            Text("See all")
                            Image(systemName: "chevron.right")
                        }
                    }
                }
                .padding()
                
                MovieSectionView(movies: movieListViewModel.movies)
            }
        }
    }
}
//
//struct SearchAllListView_Previews: PreviewProvider {
//    static var previews: some View {
//       // SearchAllListView()
//    }
//}
