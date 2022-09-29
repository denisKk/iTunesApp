//
//  SongDetailView.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

import SwiftUI

struct SongDetailView: View {
    
    let song: Song
    
    var body: some View {
        Text(song.trackName)
    }
}

struct SongDetailView_Previews: PreviewProvider {
    static var previews: some View {
        SongDetailView(song: Song.example())
    }
}
