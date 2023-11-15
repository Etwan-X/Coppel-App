//
//  ProductosCollectionView.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import UIKit

class ProductosCollectionView: UIView {
    
    @IBOutlet weak var coleccionProductos: UICollectionView!
    var productos: [Articulo] = []
    private let marcas: [Marcas] = [.apple, .motorola, .samsung, .xiaomi]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
        setupView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
        setupView()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("ProductosCollectionView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func setupView(){
        coleccionProductos.dataSource = self
        coleccionProductos.delegate = self
        coleccionProductos.register(ProductosCell.nib(), forCellWithReuseIdentifier: ProductosCell.identifier)
        FirebaseConnection().searchArticulos(marcas: marcas, view: self)
    }
}

extension ProductosCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if productos.count == 0 {
            return 5
        }
        return productos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductosCell", for: indexPath) as! ProductosCell
        if productos.count != 0 {
            ProductosController().loadData(cell: cell, productos: productos[indexPath.row])
        }
        return cell
    }
}
