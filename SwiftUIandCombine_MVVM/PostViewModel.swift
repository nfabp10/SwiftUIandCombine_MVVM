//
//  PostViewModel.swift
//  SwiftUIandCombine_MVVM
//
//  Created by Nfabp10 on 05/09/2023.
//

//Seria el ViewModel
//Vamos a usar COMBINE porque es muy util para integrar con swiftUI, y programacion reactiva.

import Foundation
import Combine

class PostViewModel : ObservableObject {
    
    // Constructor para que al iniciar llame a getPost e invoque a la capa de conexion
    init() {
        getPost()
    }
    
    //Deben "publicarse" esta propiedad, son los datos.
    @Published var posts = [Post] () {
        
        //otra opcion es el willSet, son observadores de la propiedad.
        didSet {
            didChange.send(self)
        }
    }
    
    // Es un objeto mas reactivo, que crea como un emisor para el Combine, el Never en realidad es para no lanzar errores. Si tuvieramos un handdler seria ese el segundo argumento.
    let didChange = PassthroughSubject<PostViewModel, Never>()
    
    
    //se comunica con la capa de conexion para traer los datos
    func getPost () {
       
        
        NetworkManager().getPosts { (post) in
            self.posts = post
        }
      
    }
}
