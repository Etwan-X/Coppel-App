//
//  ProductosCell.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import UIKit

class ProductosCell: UICollectionViewCell {

    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var descripcionLabel: UILabel!
    @IBOutlet weak var ofertaLabel: UIImageView!
    @IBOutlet weak var exclusivoLabel: UIImageView!
    @IBOutlet weak var precio: UILabel!
    @IBOutlet weak var descuento: UILabel!
    @IBOutlet weak var envioLabel: UIImageView!
    @IBOutlet weak var sucursalLabel: UIImageView!
    
    static let identifier = "ProductosCell"
    
    static func nib() -> UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func habilitaOpcion(status: Bool, image: UIImageView){
        if status {
            image.isHidden = false
        }else{
            image.isHidden = true
        }
    }
}
