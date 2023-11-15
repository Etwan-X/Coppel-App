//
//  MarcasCell.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import UIKit

class MarcasCell: UICollectionViewCell {

    @IBOutlet weak var image: UIImageView!
    
    static let identifier = "MarcasCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
