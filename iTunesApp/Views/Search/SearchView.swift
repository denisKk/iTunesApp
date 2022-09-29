//
//  SearchView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var selectedEntityType: EntityType = .all
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songsListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                Picker("", selection: $selectedEntityType) {
                    ForEach(EntityType.allCases) { type in
                        Text(type.name())
                            .tag(type)
                    }
                }
                .pickerStyle(.segmented)
                .padding(.horizontal)
                
                
                Divider()
                
                if searchTerm.isEmpty {
                    TrendsView(searchTerm: $searchTerm)
                } else {
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumListViewModel, songsListViewModel: songsListViewModel, movieListViewModel: movieListViewModel)
                    case .album:
                        AlbumListView(albumListViewModel: albumListViewModel)
                            .onAppear{
                                albumListViewModel.searchTerm = searchTerm
                            }
                    case .song:
                        SongListView(songListViewModel: songsListViewModel)
                            .onAppear{
                                songsListViewModel.searchTerm = searchTerm
                            }
                    case .movie:
                        MovieListView(movieListViewModel: movieListViewModel)
                            .onAppear{
                                movieListViewModel.searchTerm = searchTerm
                            }
                    }
                }
                
                
            }
            .navigationTitle("Search")
            .searchable(text: $searchTerm)
            .frame(maxHeight: .infinity, alignment: .top)
            
        }
        .onChange(of: searchTerm) { newValue in
            
            switch selectedEntityType {
            case .all:
                albumListViewModel.searchTerm = newValue
                songsListViewModel.searchTerm = newValue
                movieListViewModel.searchTerm = newValue
            case .album:
                albumListViewModel.searchTerm = newValue
            case .song:
                songsListViewModel.searchTerm = newValue
            case .movie:
                movieListViewModel.searchTerm = newValue
            }
            
        }
     
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
