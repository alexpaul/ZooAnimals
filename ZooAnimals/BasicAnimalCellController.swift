//
//  BasicAnimalCellController.swift
//  ZooAnimals
//
//  Created by Alex Paul on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class BasicAnimalCellController: UIViewController {
    
  @IBOutlet weak var tableView: UITableView!
  
  var animals = [ZooAnimal]() {
    didSet { // property observer
      tableView.reloadData()
    }
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    loadData()
  }
  
  func loadData(){
    animals = ZooAnimal.zooAnimals
  }
}

extension BasicAnimalCellController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return animals.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "animalCell", for: indexPath)
    // cell is of type UITableViewCell not a custom cell
    
    // get current animal
    let animal = animals[indexPath.row]
    
    // configure cell to be a "subtitle"
    cell.imageView?.image = UIImage(named: animal.imageNumber.description)
    cell.textLabel?.text = animal.name
    cell.detailTextLabel?.text = animal.origin
    
    return cell
  }
}
