//
//  FirebaseConnection.swift
//  Coppel App
//
//  Created by Etwan on 14/11/23.
//

import Foundation
import FirebaseFirestore
import FirebaseRemoteConfig

class FirebaseConnection: NSObject {
    
    private let db = Firestore.firestore()
    private var sku: [String] = []
    let remoteConfig = RemoteConfig.remoteConfig()
    private var settings = RemoteConfigSettings()

    // MARK: Firestore
    func searchCategorias(tipoCategorias: [TipoCategorias], view: CategoriasCollectionView){
        for seccion in tipoCategorias {
            self.db.collection("categorias").document(seccion.rawValue).getDocument{(documentSnapshot, error) in
                if let document = documentSnapshot, error == nil{
                    if let tipo = document.get("tipo") as? String, let urlImage = document.get("urlImage") as? String {
                        view.categorias.append(Categorias(tipo: tipo, urlImage: urlImage))
                        view.coleccionCategorias.reloadData()
                    }
                }
            }
        }
    }
    
    
    func searchArticulos(marcas:[Marcas], view:ProductosCollectionView){
        for marca in marcas {
            self.db.collection("productos").document("celulares").collection(marca.rawValue).document("modelos").getDocument{(documentSnapshot, error) in
                if let document = documentSnapshot, error == nil{
                    if let descripcion = document.get("descripcion") as? String, let urlImage = document.get("urlImage") as? String {
                        view.productos.append(Articulo(image: urlImage, exclusivo: false, oferta: true, descripcion: descripcion, precio: "", precioDesc: "", envio: true, sucursal: true))
                        view.coleccionProductos.reloadData()
                    }
                }
            }
        }
    }
    
    func searchMarcas(marcas:[Marcas], view:MarcasCollectionView){
        for marca in marcas {
            self.db.collection("marcas").document(marca.rawValue.lowercased()).getDocument{(documentSnapshot, error) in
                if let document = documentSnapshot, error == nil{
                    if let url = document.get("urlImage") as? String{
                        view.marcas.append(Marca(urlImage: url))
                        view.marcasColecion.reloadData()
                    }
                }
            }
        }
    }
    
    // MARK: Remote Config
    
    func setRemoteConfiguration(){
        settings.minimumFetchInterval = 60
        self.remoteConfig.configSettings = self.settings
    }
    
    func getRemoteBanner(view: HomeViewController) {
        setRemoteConfiguration()
        self.remoteConfig.fetchAndActivate { status, error in
            if status != .error {
                let showViewBanner = self.remoteConfig.configValue(forKey: "show_view_banner").boolValue
                let viewBannerImage = self.remoteConfig.configValue(forKey: "view_banner_image").stringValue
                DispatchQueue.main.async {
                    view.banner.isHidden = showViewBanner
                    CoreController().cargarImagen(urlImg: viewBannerImage ?? "", image: view.bannerImage)
                }
            } else {
                self.remoteConfig.setDefaults(["show_view_banner": NSNumber(false), "view_banner_image": NSString("https://firebasestorage.googleapis.com/v0/b/practica-ios-3a925.appspot.com/o/banners%2FBuenFin_Adelanto2023_Desktop_03_.jpg?alt=media&token=bb187090-779e-42c8-bcac-64d62b73b1fa")])
            }
        }
    }
    
    func getRemoteVersion(view: AuthViewController) {
        setRemoteConfiguration()
        self.remoteConfig.fetchAndActivate { status, error in
            if status != .error {
                let appVersion = self.remoteConfig.configValue(forKey: "app_version").stringValue!
                DispatchQueue.main.async {
                    print("Version remota \(appVersion)")
                    if !appVersion.contains(Bundle.main.releaseVersionNumber!){
                        let alertController = UIAlertController(title: "ACTUALIZACIÓN DISPONIBLE", message: "Te encuentras usando una versión antigua de la aplicación, te recomendamos actualizarla lo antes posible", preferredStyle: .alert)
                        alertController.addAction(UIAlertAction(title: "Aceptar", style: .default))
                        view.present(alertController, animated: true, completion: nil)
                    }else{
                        view.splash.isHidden = true
                    }
                }
            }else{
                if error.debugDescription.contains("Code=8003") {
                    
                }
                self.remoteConfig.setDefaults(["app_version": NSString("1.0")])
            }
        }
    }
    
    func getRemoteMantenimiento(view: HomeViewController){
        setRemoteConfiguration()
        self.remoteConfig.fetchAndActivate { status, error in
            if status != .error {
                let viewMantenimiento = self.remoteConfig.configValue(forKey: "view_mantenimiento").boolValue
                        DispatchQueue.main.async {
                            view.mantenimientoView.isHidden = viewMantenimiento
                            view.banner.isHidden = !viewMantenimiento
                        }
            }else{
                self.remoteConfig.setDefaults(["view_mantenimiento":NSNumber(true), "show_view_banner": NSNumber(true)])
                view.mantenimientoView.isHidden = true
                view.banner.isHidden = true
            }
        }
                
    }
    
}
