//
//  PersonDetailTableViewController.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import UIKit

class PersonDetailTableViewController: UITableViewController, AlertDisplayer {
    
    @IBOutlet var detailTableView: UITableView!
    @IBOutlet weak var yearOfBirthLabel: UILabel!
    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var heightLabel: UILabel!
    @IBOutlet weak var massLabel: UILabel!
    @IBOutlet weak var skinColorLabel: UILabel!
    @IBOutlet weak var hairColorLabel: UILabel!
    @IBOutlet weak var eyeColorLabel: UILabel!
    
    var viewModel: PersonDetailViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        detailTableView.register(UINib(nibName: FilmDetailsTableViewCell.nib, bundle: nil), forCellReuseIdentifier: FilmDetailsTableViewCell.identifier)
        
        guard let vm = viewModel else { return }
        
        let person = vm.person
        navigationItem.title = person.name
        
        yearOfBirthLabel.text = person.birthYear
        genderLabel.text = person.gender
        heightLabel.text = person.height
        massLabel.text = person.mass
        skinColorLabel.text = person.skinColor
        hairColorLabel.text = person.hairColor
        eyeColorLabel.text = person.eyeColor
    }
    
    // MARK: - numberOfSections
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    // MARK: - numberOfRowsInSection
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 2 {
            return viewModel?.filmCount ?? 0
        }
        return super.tableView(tableView, numberOfRowsInSection: section)
    }
    
    // MARK: - cellForRowAt
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 2 {
            guard let cell = detailTableView.dequeueReusableCell(withIdentifier: FilmDetailsTableViewCell.identifier) as? FilmDetailsTableViewCell, let vm = viewModel else { return UITableViewCell() }
            
            vm.isFetchInProcess ? cell.configure(with: .none) : cell.configure(with: viewModel?.film(at: indexPath.row))
            return cell
        }
        return super.tableView(tableView, cellForRowAt: indexPath)
    }
    
    // MARK: - indentationLevelForRowAt
    override func tableView(_ tableView: UITableView, indentationLevelForRowAt indexPath: IndexPath) -> Int {
        if indexPath.section == 2 {
            let newIndexPath = IndexPath(row: 0, section: indexPath.section)
            return super.tableView(tableView, indentationLevelForRowAt: newIndexPath)
        }
        return super.tableView(tableView, indentationLevelForRowAt: indexPath)
    }
    
    // MARK: - heightForRowAt
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 {
            return FilmDetailsTableViewCell.cellHeight
        }
        return super.tableView(tableView, heightForRowAt: indexPath)
    }
}

// MARK: - PersonDetailViewModelDelegate
extension PersonDetailTableViewController: PersonDetailViewModelDelegate {
    func onFetchCompleted() {
        detailTableView.reloadData()
    }
    
    func onFetchFailed(with reason: String) {
        let title = "Warning"
        let action = UIAlertAction(title: "OK", style: .default)
        displayAlert(with: title , message: reason, actions: [action])
    }
}
