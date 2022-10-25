//
//  SongListView.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import SwiftUI
import UIKit

struct SongListView: View {
    
    @ObservedObject var songListViewModel = SongListViewModel()
    
    var body: some View {
        
        
        VStack(spacing: 0){
            
            ScrollView{
                LazyVStack {
                    rows()
                    
                    switch songListViewModel.state {
                    case .start:
                        if songListViewModel.songs.count > 0 {
                            Color.clear
                                .onAppear{
                                    songListViewModel.loadMore()
                                }
                        }
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
            }
            .padding(.horizontal)
            .background(Color.bg)
            
        }
    }
    
    func rows() -> some View {
        ForEach(songListViewModel.songs) { song in
            NavigationLink {
                SongDetailView(song: song)
                
            } label: {
                SongRowView(song: song)
            }
            .buttonStyle(.plain)
        }
    }
}

struct SongListView_Previews: PreviewProvider {
    static var previews: some View {
        SongListView(songListViewModel: SongListViewModel.example())
    }
}


