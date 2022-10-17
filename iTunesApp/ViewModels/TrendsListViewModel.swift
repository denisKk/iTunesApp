//
//  TrendsListViewModel.swift
//  iTunesApp
//
//  Created by Dev on 29.09.22.
//

import Foundation
import Combine

class TrendsListViewModel: ObservableObject {
   
    @Published var trends: [Adam] = []
    @Published var state: FetchState = .start
    
    let count: Int  = 5
    
    let service = APIService()

    
    func feachTrends() {
        guard state == .start else {return}
        
        state = .isLoading
        
        service.feachTrends(count: count) {[weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .failure(let error):
                    self?.state = .error("Could not load: \(error.localizedDescription)")
                case .success(let results):
                    self?.trends = results.first?.adams ?? []
                    self?.state = .start
                }
            }
        }
    }

}

