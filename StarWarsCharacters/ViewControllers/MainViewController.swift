//
//  MainViewController.swift
//  StarWarsCharacters
//
//  Created by Samir on 11/23/19.
//  Copyright © 2019 Samir Anghan. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {

    @IBOutlet weak var peopleTableView: UITableView!
    @IBOutlet weak var tableViewActivityIndicator: UIActivityIndicatorView!
    
    private var viewModel: PersonViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Star Wars People"
        viewModel = PersonViewModel()
        viewModel?.delegate = self
        viewModel?.fetchPeople()
        setupTableView()
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
}

// MARK: - UITableViewDelegate
extension MainViewController: UITableViewDelegate {
    private func setupTableView() {
        peopleTableView.delegate = self
        peopleTableView.dataSource = self
        peopleTableView.keyboardDismissMode = .onDrag
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        //performSegue(withIdentifier: "detailViewSegue", sender: viewModel?.dataToDisplay[indexPath.row])
    }
}

// MARK: - UITableViewDataSource
extension MainViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.dataSource.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "personCellIdentifier", for: indexPath)
        
        guard let vm = viewModel else { return cell }
        
        cell.textLabel?.text = vm.dataSource[indexPath.row].name
        return cell
    }
}

// MARK: - PersonViewModelDelegate
extension MainViewController: PersonViewModelDelegate {
    func loading() {
        tableViewActivityIndicator.startAnimating()
    }
    
    func dataReady() {
        DispatchQueue.main.async {
            self.peopleTableView.reloadData()
            self.tableViewActivityIndicator.stopAnimating()
        }
    }
    
    func errorLoading() {
        tableViewActivityIndicator.stopAnimating()
    }
}
