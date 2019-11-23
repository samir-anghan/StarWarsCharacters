//
//  PersonViewModel.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

protocol PersonViewModelDelegate: class {
    func onFetchCompleted(with newIndexPathsToReload: [IndexPath]?)
    func onFetchFailed(with reason: String)
}

class PersonViewModel {
    
    private weak var delegate: PersonViewModelDelegate?
    
    private var persons: [Person] = []
    private var currentPage = 1
    private var total = 0
    private var isFetchInProgress = false
    
    init(delegate: PersonViewModelDelegate) {
      self.delegate = delegate
    }
    
    var totalCount: Int {
      return total
    }
    
    var currentCount: Int {
      return persons.count
    }
    
    func person(at index: Int) -> Person {
      return persons[index]
    }
    
    func fetchPersons() {
        guard !isFetchInProgress else { return }
        
        isFetchInProgress = true
        
        NetworkManager.shared.getAllPersons(page: currentPage) { response, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.isFetchInProgress = false
                    self.delegate?.onFetchFailed(with: error)
                    print("Error fetching people data: \(error)")
                    return
                }
            }
            
            if let response = response {
                DispatchQueue.main.async {
                    self.currentPage += 1
                    self.isFetchInProgress = false
                    self.total = response.total
                    self.persons.append(contentsOf: response.persons)
                    
                    if self.currentPage > 2 {
                        let indexPathsToReload = self.calculateIndexPathsToReload(from: response.persons)
                        self.delegate?.onFetchCompleted(with: indexPathsToReload)
                    } else {
                        self.delegate?.onFetchCompleted(with: nil)
                    }
                }
            }
        }
    }
    
    private func calculateIndexPathsToReload(from newPersons: [Person]) -> [IndexPath] {
      let startIndex = newPersons.count - newPersons.count
      let endIndex = startIndex + newPersons.count
      return (startIndex..<endIndex).map { IndexPath(row: $0, section: 0) }
    }
}
