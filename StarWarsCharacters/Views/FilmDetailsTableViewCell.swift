//
//  FilmDetailsTableViewCell.swift
//  StarWarsCharacters
//
//  Created by Dev on 11/25/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import UIKit

class FilmDetailsTableViewCell: UITableViewCell {
    static let nib = "FilmDetailsTableViewCell"
    static let identifier = "FilmDetailsTableViewCellIdentifier"
    static let cellHeight: CGFloat = 48
    
    @IBOutlet weak var filmNameLabel: UILabel!
    @IBOutlet weak var openingCrawlWordsCountLabel: UILabel!
    @IBOutlet weak var indicatorView: UIActivityIndicatorView!
    @IBOutlet weak var labelsContainerView: UIView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        configure(with: .none)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        indicatorView.hidesWhenStopped = true
        isUserInteractionEnabled = false
    }
    
    func configure(with film: Film?) {
        if let film = film {
            labelsContainerView.isHidden = false
            filmNameLabel.text = film.title
            openingCrawlWordsCountLabel.text = "\(film.openingCrawl.numberOfWords())"
            indicatorView.stopAnimating()
        } else {
            labelsContainerView.isHidden = true
            indicatorView.startAnimating()
        }
    }
}
