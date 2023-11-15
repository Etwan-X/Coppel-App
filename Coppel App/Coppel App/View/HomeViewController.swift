//
//  HomeViewController.swift
//  Coppel App
//
//  Created by Etwan on 13/11/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var banner: UIView!
    @IBOutlet weak var bannerImage: UIImageView!
    @IBOutlet weak var mantenimientoView: UIView!
    @IBOutlet weak var categoriasCollection: CategoriasCollectionView!
    @IBOutlet weak var productosCollection: ProductosCollectionView!
    @IBOutlet weak var marcasCollection: MarcasCollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        FirebaseConnection().getRemoteBanner(view: self)
        FirebaseConnection().getRemoteMantenimiento(view: self)
        
    }
    @IBAction func closeBanner(_ sender: Any) {
        banner.isHidden = true
    }
}
