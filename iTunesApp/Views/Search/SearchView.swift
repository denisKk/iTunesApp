//
//  SearchView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI
import UIKit

struct SearchView: View {
    
    @State private var searchTerm: String = ""
    @State private var selectedEntityType: EntityType = .all
    
    @StateObject private var albumListViewModel = AlbumListViewModel()
    @StateObject private var songsListViewModel = SongListViewModel()
    @StateObject private var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        NavigationView {
            VStack {
                
                SearchBarView(searhTerm: $searchTerm)
                    .padding(.horizontal, 10)
                
                CasePicker(selectedTab: $selectedEntityType)
                    .padding(.horizontal, 10)
             
                Divider()
                
                if searchTerm.isEmpty {
                    TrendsView(searchTerm: $searchTerm)
                } else {
                    switch selectedEntityType {
                    case .all:
                        SearchAllListView(albumListViewModel: albumListViewModel, songsListViewModel: songsListViewModel, movieListViewModel: movieListViewModel)
                    case .album:
                        AlbumListView(albumListViewModel: albumListViewModel)
                    case .song:
                        SongListView(songListViewModel: songsListViewModel)
                    case .movie:
                        MovieListView(movieListViewModel: movieListViewModel)
                    }
                }
                
                
            }
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                        ToolbarItem(placement: .principal) {
                            HStack() {
                                Text("Library")
                                    .font(.title)
                                    .padding(.bottom, 12)
                                Spacer()
                            }
                            
                        }
                    }
            .frame(maxHeight: .infinity, alignment: .top)
            .background(Color.bg)
            .foregroundColor(.fontPrimary)
            
        }
        .onChange(of: selectedEntityType, perform: { newValue in
            updateViewModels(with: searchTerm, selectedEntityType: newValue)
        })
        .onChange(of: searchTerm) { newValue in
            updateViewModels(with: newValue, selectedEntityType: selectedEntityType)
        }
        .background(.green)
        
    }
    
    func updateViewModels(with searchTerm: String, selectedEntityType: EntityType) {
        
        switch selectedEntityType {
        case .all:
            albumListViewModel.searchTerm = searchTerm
            songsListViewModel.searchTerm = searchTerm
            movieListViewModel.searchTerm = searchTerm
        case .album:
            albumListViewModel.searchTerm = searchTerm
            songsListViewModel.searchTerm = ""
            movieListViewModel.searchTerm = ""
        case .song:
            songsListViewModel.searchTerm = searchTerm
            albumListViewModel.searchTerm = ""
            movieListViewModel.searchTerm = ""
        case .movie:
            movieListViewModel.searchTerm = searchTerm
            songsListViewModel.searchTerm = ""
            albumListViewModel.searchTerm = ""
        }
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
    }
}
