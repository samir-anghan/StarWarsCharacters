//
//  PersonDetailViewModel.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

protocol PersonDetailViewModelDelegate: class {
    func onFetchCompleted()
}

class PersonDetailViewModel {
    
    private weak var delegate: PersonDetailViewModelDelegate?
    private var films: [Film] = []
    
    var person: Person
    var isFetchInProcess = true
    
    init(person: Person, delegate: PersonDetailViewModelDelegate) {
        self.person = person
        self.delegate = delegate
        fetchFilms()
    }
    
    var filmCount: Int {
        return person.films.count
    }
    
    func film(at index: Int) -> Film {
        return films[index]
    }
    
    private func fetchFilms() {
        let fetchDispatchGroup = DispatchGroup()
        
        for filmUrl in person.films {
            guard let filmIdString = filmUrl.lastPathComponent(), let filmId = Int(filmIdString) else { continue }
            
            fetchDispatchGroup.enter()
            self.isFetchInProcess = true
            NetworkManager.shared.getFilm(id: filmId) { response, error in
                if let error = error {
                    print("Error fetching film data: \(error)")
                    return
                }
                if let response = response {
                    DispatchQueue.main.async {
                        self.films.append(response)
                        fetchDispatchGroup.leave()
                    }
                }
            }
        }
        fetchDispatchGroup.notify(queue: DispatchQueue.main) {
            self.delegate?.onFetchCompleted()
            self.isFetchInProcess = false
        }
    }
}
