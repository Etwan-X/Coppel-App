//
//  CategoriasCollectionView.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import UIKit

class CategoriasCollectionView: UIView {
    
    @IBOutlet weak var coleccionCategorias: UICollectionView!
    var categorias: [Categorias] = []
    private let tipoCategorias: [TipoCategorias] = [.accesorios, .accesoriosApple, .celularesCompania, .celularesreacondicionados, .equipos, .smartwatches]
    
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
        let viewFromXib = Bundle.main.loadNibNamed("CategoriasCollectionView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
    }
    
    func setupView(){
        coleccionCategorias.dataSource = self
        coleccionCategorias.delegate = self
        coleccionCategorias.register(CategoriasCell.nib(), forCellWithReuseIdentifier: CategoriasCell.identifier)
        FirebaseConnection().searchCategorias(tipoCategorias: tipoCategorias, view: self)
    }
}

extension CategoriasCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if categorias.count == 0 {
            return 5
        }
        return categorias.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CategoriasCell", for: indexPath) as! CategoriasCell
        if categorias.count != 0 {
            CategoriasController().loadData(cell: cell, categoria: categorias[indexPath.row])
        }
        return cell
    }
}
