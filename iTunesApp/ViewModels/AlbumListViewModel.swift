//
//  AlbumListViewModel.swift
//  iTunes
//
//  Created by Dev on 20.09.22.
//

import Foundation
import Combine
//https://itunes.apple.com/search?term=jack+johnson.
//https://itunes.apple.com/search?term=jack+johnson&entity=album&limit=5&offset=10
//https://itunes.apple.com/search?term=jack+johnson&entity=song&limit=5
//https://itunes.apple.com/search?term=jack+johnson&entity=movie&limit=5

class AlbumListViewModel: ObservableObject {
    
    
    @Published var searchTerm: String = ""
    @Published var albums: [Album] = []
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
                self?.albums = []
                self?.page = 0
                self?.state = .start
                self?.feachAlbums(for: term)
            }.store(in: &subscriptions)
    }
    
    func loadMore(){
        feachAlbums(for: searchTerm)
    }
    
    func feachAlbums(for searchTerm: String) {
        
        guard searchTerm.isEmpty == false else {return}
        guard state == .start else {return}
        
        let offset = page * limit
        
        state = .isLoading
        
        service.feachAlbums(for: searchTerm, page: offset, limit: limit) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                case .success(let results):
                    self?.albums.append(contentsOf: results.results)
                    self?.page += 1
                    
                    self?.state = (results.results.count == self?.limit) ? .start : .loadedAll
                }
            }
        }
    }
    
    static func example() -> AlbumListViewModel {
        let vm = AlbumListViewModel()
        vm.albums = [Album.example()]
        return vm
    }
}
