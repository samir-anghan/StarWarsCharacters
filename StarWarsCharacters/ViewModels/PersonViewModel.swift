//
//  PersonViewModel.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import Foundation

protocol PersonViewModelDelegate: class {
    func loading()
    func dataReady()
    func errorLoading()
}

class PersonViewModel {
    
    var dataSource = [Person]()
    
    weak var delegate: PersonViewModelDelegate?
    
    func fetchPeople() {
        delegate?.loading()
        NetworkManager.shared.getAllPersons(page: 1) { persons, error in
            if let persons = persons {
                self.dataSource = persons
                self.delegate?.dataReady()
                return
            }
            
            if let error = error {
                self.delegate?.errorLoading()
                print("Error fetching people data: \(error)")
            }
        }
    }
    
}
