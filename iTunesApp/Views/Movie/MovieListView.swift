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
        
        ScrollView {
            LazyVStack{
                ForEach(movieListViewModel.movies) { movie in
                    MovieRowView(movie: movie)
                        .padding(.horizontal)
                }
                
                switch movieListViewModel.state {
                case .isLoading:
                    ProgressView()
                        .progressViewStyle(CircularProgressViewStyle(tint: .white))
                        
                case .error(let message):
                    Text(message)
                        .foregroundColor(.red)
                    
                default:
                    Color.clear
                }
            }
            .listStyle(.plain)
        }
        .background(Color.bg)
    }
    
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView(movieListViewModel: MovieListViewModel.example())
    }
}
