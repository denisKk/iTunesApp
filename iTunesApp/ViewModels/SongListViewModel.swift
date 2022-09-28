//
//  SongListViewModel.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import Foundation
import Combine


class SongListViewModel: ObservableObject {
    
    
    @Published var searchTerm: String = ""
    @Published var songs: [Song] = []
    @Published var state: FetchState = .start
    
    let limit: Int  = 20
    var page: Int = 0
    
    let service = APIService()
    
    var subscriptions = Set<AnyCancellable>()
    
    init(){
        $searchTerm
            .removeDuplicates()
            .dropFirst()
            .debounce(for: .seconds(0.5), scheduler: RunLoop.main)
            .sink { [weak self] term in
                self?.songs.removeAll()
                self?.page = 0
                self?.state = .start
                self?.feachSongs(for: term)
            }.store(in: &subscriptions)
    }
    
    func loadMore(){
        feachSongs(for: searchTerm)
    }
    
    func feachSongs(for searchTerm: String) {
        
        guard searchTerm.isEmpty == false else {return}
        guard state == .start else {return}
        let offset = page * limit
        
        state = .isLoading
        
        service.feachSongs(for: searchTerm, page: offset, limit: limit) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                case .success(let results):
                    self?.songs.append(contentsOf: results.results)
                    self?.page += 1
                    
                    self?.state = (results.results.count == self?.limit) ? .start : .loadedAll
                }
            }
        }
    }
    
    static func example() -> SongListViewModel {
        let vm = SongListViewModel()
        vm.songs = [Song.example()]
        return vm
    }
}
