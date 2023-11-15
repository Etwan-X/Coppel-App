//
//  Articulo.swift
//  Coppel App
//
//  Created by Etwan on 13/11/23.
//

import Foundation

struct Articulo: Codable {
    let image : String
    let exclusivo: Bool
    let oferta: Bool
    let descripcion: String
    let precio: String
    let precioDesc: String
    let envio: Bool
    let sucursal: Bool
}
