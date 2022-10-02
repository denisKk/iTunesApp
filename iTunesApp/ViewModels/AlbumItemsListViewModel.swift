//
//  AlbumItemsListViewModel.swift
//  iTunesApp
//
//  Created by Dev on 22.09.22.
//

import SwiftUI

class AlbumItemsListViewModel: ObservableObject {
    
    let albumID: Int
    @Published var songs: [Song] = []
    @Published var state: FetchState = .start
    
    init(albumID: Int) {
        self.albumID = albumID
    }
    
    func fetch(){
        fetchSongs(for: albumID)
        print("FETCH")
    }
    
    private var service = APIService()
    
    private func fetchSongs(for albumID: Int) {
        state = .isLoading
        service.feachSongs(for: albumID) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                case .success(let results):
                    
                    print("OK")
                    var songs = results.results
                    
                    if results.resultCount > 0 {
                        _ = songs.removeFirst()
                    }
                    
                    self?.songs = songs.sorted(by: {$0.trackNumber < $1.trackNumber})
                    self?.state = .start
                }
            }
        }
    }
    
    static func example() -> AlbumItemsListViewModel {
        let vm = AlbumItemsListViewModel(albumID: 1)
        vm.songs = [Song.example()]
        return vm
    }
}


