//
//  CategoriasController.swift
//  Coppel App
//
//  Created by Etwan on 15/11/23.
//

import Foundation

class CategoriasController: NSObject {
    
    func loadData(cell: CategoriasCell, categoria: Categorias){
        cell.nombreCategoria.text = categoria.tipo
        CoreController().cargarImagen(urlImg: categoria.urlImage, image: cell.imagenCategoria)
    }
}
