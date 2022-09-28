//
//  MovieListViewModel.swift
//  iTunesApp
//
//  Created by Dev on 21.09.22.
//

import Foundation
import Combine


class MovieListViewModel: ObservableObject {
    
    
    @Published var searchTerm: String = ""
    @Published var movies: [Movie] = []
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
                self?.state = .start
                self?.feachMovie(for: term)
            }.store(in: &subscriptions)
    }
    
    func feachMovie(for searchTerm: String) {
        
        guard searchTerm.isEmpty == false else {return}
        guard state == .start else {return}
    
        
        state = .isLoading
        
        service.feachMovie(for: searchTerm) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                case .success(let results):
                    self?.movies = results.results
                    self?.state = .start
                }
            }
        }
    }
    
    static func example() -> MovieListViewModel {
        let vm = MovieListViewModel()
        vm.movies = [Movie.example()]
        return vm
    }
}

