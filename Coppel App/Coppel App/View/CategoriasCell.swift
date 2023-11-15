//
//  CategoriasCell.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import UIKit

class CategoriasCell: UICollectionViewCell {

    @IBOutlet weak var imagenCategoria: UIImageView!
    @IBOutlet weak var nombreCategoria: UILabel!
    
    static let identifier = "CategoriasCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
