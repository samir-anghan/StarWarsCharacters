//
//  PersonTableViewCell.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import UIKit

class PersonTableViewCell: UITableViewCell {
    static let identifier = "personCellIdentifier"
    
    @IBOutlet weak var personNameLabel: UILabel!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        configure(with: .none)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        indicatorView.hidesWhenStopped = true
    }
    
    func configure(with person: Person?) {
        if let person = person {
            self.isUserInteractionEnabled = true
            personNameLabel.alpha = 1
            personNameLabel.text = person.name
            indicatorView.stopAnimating()
        } else {
            self.isUserInteractionEnabled = false
            personNameLabel.alpha = 0
            indicatorView.startAnimating()
        }
    }
}
