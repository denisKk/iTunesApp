//
//  AlbumForSongViewModel.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

import Foundation

class AlbumForSongViewModel: ObservableObject {
    
    @Published var album: Album?
    @Published var state: FetchState = .start
    
    let service = APIService()
    
    func feach(song: Song) {

        let albumID = song.collectionID
        state = .isLoading
        
        service.feachAlbum(for: albumID) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                case .success(let results):
                    self?.album = results.results.first
                    self?.state = .start
                }
            }
        }
    }
}
