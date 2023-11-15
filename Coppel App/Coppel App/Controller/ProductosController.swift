//
//  ProductosController.swift
//  Coppel App
//
//  Created by Etwan on 15/11/23.
//

import Foundation

class ProductosController: NSObject {
    
    func loadData(cell: ProductosCell, productos: Articulo){
        cell.descripcionLabel.text = productos.descripcion
        cell.descuento.text = productos.precioDesc
        cell.precio.text = productos.precio
        CoreController().cargarImagen(urlImg: productos.image, image: cell.productImage)
        cell.habilitaOpcion(status: productos.exclusivo, image: cell.exclusivoLabel)
        cell.habilitaOpcion(status: productos.envio, image: cell.envioLabel)
        cell.habilitaOpcion(status: productos.sucursal, image: cell.sucursalLabel)
        cell.habilitaOpcion(status: productos.oferta, image: cell.ofertaLabel)
    }
}
