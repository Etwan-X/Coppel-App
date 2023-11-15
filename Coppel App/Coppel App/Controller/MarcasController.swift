//
//  MarcasController.swift
//  Coppel App
//
//  Created by Etwan on 15/11/23.
//

import Foundation
class MarcasController: NSObject {
    
    func loadData(cell: MarcasCell, marca: Marca){
        CoreController().cargarImagen(urlImg: marca.urlImage, image: cell.image)
    }
}
