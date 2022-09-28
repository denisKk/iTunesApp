//
//  SearchView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI

struct AlbumSearchView: View {
    @StateObject var albumListVM = AlbumListViewModel()
    
    var body: some View {
        NavigationView {
            
            Group {
                if albumListVM.searchTerm.isEmpty {
                    PlaceHolderView(searchTerm: $albumListVM.searchTerm)
                } else {
                    AlbumListView(albumListViewModel: albumListVM)
                }
            }
            .searchable(text: $albumListVM.searchTerm)
            .navigationTitle("Search Albums")
        }
    }
}

struct PlaceHolderView: View {
    
    @Binding var searchTerm: String
    
    let recent = ["oxxximiron", "kpss", "jony boy"]
    
    var body: some View {
        VStack {
            Text("Trending")
            ForEach(recent, id: \.self) { item in
                Button {
                    searchTerm = item
                } label: {
                    Text(item)
                }
            }
        }
    }
}

struct AlbumSearchView_Previews: PreviewProvider {
    static var previews: some View {
        AlbumSearchView()
    }
}
