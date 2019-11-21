//
//  ViewController.swift
//  StarWarsCharacters
//
//  Created by Dev on 11/20/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
//    init(networkManager: NetworkManager) {
//        super.init(nibName: nil, bundle: nil)
//        self.networkManager = networkManager
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        var networkManager = NetworkManager()
        
        networkManager.getAllPersons { persons, error in
            if let error = error {
                print(error)
            }
            if let persons = persons {
                print(persons)
            }
        }
    }


}

