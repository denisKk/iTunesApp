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
                if !songsListViewModel.songs.isEmpty {
                    sectionTitle(title: "Songs", detination: AnyView(SongListView(songListViewModel: songsListViewModel)))
                    
                    SongSectionView(songs: songsListViewModel.songs)
                        .padding(.leading)
                    
                    Divider()
                }
                
                if !albumListViewModel.albums.isEmpty {
                    sectionTitle(title: "Albums", detination: AnyView(AlbumListView(albumListViewModel: albumListViewModel)))
                    
                    AlbumSectionView(albums: albumListViewModel.albums)
                        .padding(.leading)
                    
                    Divider()
                }
               
                
                if !movieListViewModel.movies.isEmpty {
                    sectionTitle(title: "Movies", detination: AnyView(MovieListView(movieListViewModel: movieListViewModel)))
                        
                    MovieSectionView(movies: movieListViewModel.movies)
                        .padding(.leading)
                }
            }
        }
    }
    
    
    @ViewBuilder
    func sectionTitle(title: String, detination: AnyView) -> some View {
     
        HStack {
            Text(title)
            Spacer()
            NavigationLink  {
               detination
            } label: {
                HStack {
                    Text("See all")
                    Image(systemName: "chevron.right")
                }
                .foregroundColor(.fontSecondary)
                .font(.caption)
            }
        }
        .padding()
     
        
    }
   
    
}
//
//struct SearchAllListView_Previews: PreviewProvider {
//    static var previews: some View {
//       // SearchAllListView()
//    }
//}
