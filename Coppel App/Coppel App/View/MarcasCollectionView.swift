//
//  MarcasCollectionView.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import UIKit

class MarcasCollectionView: UIView {
    
    @IBOutlet weak var marcasColecion: UICollectionView!
    var marcas: [Marca] = []
    private let empresas: [Marcas] = [.apple, .motorola, .samsung, .xiaomi, .oppo, .huawei]
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let viewFromXib = Bundle.main.loadNibNamed("MarcasCollectionView", owner: self, options: nil)![0] as! UIView
        viewFromXib.frame = self.bounds
        addSubview(viewFromXib)
        setupView()
    }
    
    func setupView(){
        marcasColecion.dataSource = self
        marcasColecion.delegate = self
        marcasColecion.register(MarcasCell.nib(), forCellWithReuseIdentifier: MarcasCell.identifier)
        FirebaseConnection().searchMarcas(marcas: empresas, view: self)
    }
}

extension MarcasCollectionView: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if marcas.count == 0 {
            return 5
        }
        return marcas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarcasCell.identifier, for: indexPath) as! MarcasCell
        if marcas.count != 0 {
            MarcasController().loadData(cell: cell, marca: marcas[indexPath.row])
        }
        return cell
    }
}
