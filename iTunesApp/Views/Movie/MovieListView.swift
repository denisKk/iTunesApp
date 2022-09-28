//
//  MovieListView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI

struct MovieListView: View {
    
    @ObservedObject var movieListViewModel = MovieListViewModel()
    
    var body: some View {
        
        List{
            ForEach(movieListViewModel.movies) { movie in
                MovieRowView(movie: movie)
            }
            
            switch movieListViewModel.state {
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

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
