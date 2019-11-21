//
//  AnimalDetailViewController.swift
//  ZooAnimals
//
//  Created by Alex Paul on 11/20/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalDetailViewController: UIViewController {
  
  @IBOutlet weak var animalImageView: UIImageView!
  @IBOutlet weak var animalClassificationLabel: UILabel!
  @IBOutlet weak var animalInfoTextView: UITextView!
  @IBOutlet weak var animalOrigin: UILabel!
  
  var animal: ZooAnimal?
  
  override func viewDidLoad() {
    super.viewDidLoad()
    updateUI()
  }
  
  func updateUI() {
    guard let zooAnimal = animal else {
      fatalError("couldn't set animal object, check prepare(for segue: )")
    }
    navigationItem.title = zooAnimal.name
    animalImageView.image = UIImage(named: zooAnimal.imageNumber.description)
    animalClassificationLabel.text = zooAnimal.classification
    animalInfoTextView.text = zooAnimal.info
    animalOrigin.text = zooAnimal.origin
  }
  
}
