//
//  AnimalCell.swift
//  ZooAnimals
//
//  Created by Alex Paul on 11/19/19.
//  Copyright © 2019 Alex Paul. All rights reserved.
//

import UIKit

class AnimalCell: UITableViewCell {
  
  @IBOutlet weak var animalImageView: UIImageView!
  @IBOutlet weak var animalNameLabel: UILabel!
  @IBOutlet weak var animalOriginLabel: UILabel!
  @IBOutlet weak var animalClassificationLabel: UILabel!
  
  func configureCell(for animal: ZooAnimal) {
    animalImageView.image = UIImage(named: animal.imageNumber.description)
    animalNameLabel.text = animal.name
    animalOriginLabel.text = animal.origin
    animalClassificationLabel.text = animal.classification
  }
}
