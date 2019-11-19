//
//  AnimalSectionsViewController.swift
//  ZooAnimals
//
//  Created by Alex Paul on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalSectionsViewController: UIViewController {
  
  @IBOutlet weak var tableView: UITableView!
  
  // data for the table view
  var animalClassifications = [[ZooAnimal]]() {
    didSet {
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self // for using heightForRowAt:
    loadData()
  }
  
  func loadData() {
    animalClassifications = ZooAnimal.classificationSections()
  }
}

extension AnimalSectionsViewController: UITableViewDataSource {
  // MARK:- required table view data source methods
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animalClassifications[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath) as? AnimalCell else {
      fatalError("couldn't dequeue an AnimalCell")
    }
    
    // get the animal at the current indexPath
    let animal = animalClassifications[indexPath.section][indexPath.row]
    
    // configure the cell
    cell.configureCell(for: animal)
    
    return cell
  }
  
  // MARK:- methods needed to implement sections
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return animalClassifications[section].first?.classification
  }
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return animalClassifications.count // ~ 5 sections
  }
}


extension AnimalSectionsViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return 140
  }
}
