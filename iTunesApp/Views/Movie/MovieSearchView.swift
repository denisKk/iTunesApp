//
//  AlbumSearchView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI

struct MovieSearchView: View {
    @StateObject var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        MovieListView(movieListViewModel: movieListViewModel)
    }
    
}

struct MovieSearchView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSearchView()
    }
}
