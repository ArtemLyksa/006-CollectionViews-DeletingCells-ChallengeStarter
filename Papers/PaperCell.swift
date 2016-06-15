//
//  PaperCell.swift
//  Papers
//
//  Created by Tim Mitra on 1/14/16.
//  Copyright © 2016 Razeware LLC. All rights reserved.
//

import UIKit

class PaperCell: UICollectionViewCell {
    
  @IBOutlet weak var paperImageView: UIImageView!
  @IBOutlet private weak var gradientView: GradientView!
  @IBOutlet private weak var captionLabel: UILabel!
  @IBOutlet private weak var checkedImageView: UIImageView!
  
  var editing: Bool = false {
    didSet {
      captionLabel.hidden = editing
      checkedImageView.hidden = !editing
    }
  }
  
  override var selected: Bool {
    didSet {
      if editing {
        checkedImageView.image = UIImage(named: selected ? "Checked" : "Unchecked")
      }
    }
  }

  var paper: Paper? {
    didSet {
      if let paper = paper {
        paperImageView.image = UIImage(named:  paper.imageName)
        captionLabel.text = paper.caption
      }
    }
  }
}
