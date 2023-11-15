//
//  UpdateComponents.swift
//  Coppel App
//
//  Created by Etwan on 15/11/23.
//

import Foundation
import UIKit

class CoreController: NSObject {

    func cargarImagen(urlImg: String, image: UIImageView){
        let task = URLSession.shared.dataTask(with: URL(string: urlImg)!, completionHandler: {data, _, error in
            guard let data = data, error == nil else{
                return
            }
            DispatchQueue.main.async {
                image.image = UIImage(data: data)
            }
        })
        task.resume()
    }
}



