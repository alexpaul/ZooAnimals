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
  
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    // we need the segue.destination view contrller we are navigating to
    // we need the indexPath that was selected
    
    guard let detailViewController = segue.destination as? AnimalDetailViewController,
      let indexPath = tableView.indexPathForSelectedRow else {
      fatalError("failed to get indexPath and detailViewController")
    }
    
    // get currently selected object (ZooAnimal)
    let animal = animalClassifications[indexPath.section][indexPath.row]
    
    // set the detailViewController's animal object
    detailViewController.animal = animal
  }
}

extension AnimalSectionsViewController: UITableViewDataSource {
  // MARK:- required table view data source methods
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animalClassifications[section].count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    // alternate left and right image cells base on even or odd modulo remainder
    
    var cell: AnimalCell! // implicit unwrapping
        
    if indexPath.section % 2 == 0 { // even
      guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "rightImageCell", for: indexPath) as? AnimalCell else {
        fatalError("couldn't dequeue a rightImageCell")
      }
      cell = animalCell
    } else { // odd
      guard let animalCell = tableView.dequeueReusableCell(withIdentifier: "leftImageCell", for: indexPath) as? AnimalCell else {
        fatalError("couldn't dequeue a leftImageCell")
      }
      cell = animalCell
    }
    
    // get the animal at the indexPath
    let animal = animalClassifications[indexPath.section][indexPath.row]
    
    // congigure the cell using the animal object retrieved from above
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
