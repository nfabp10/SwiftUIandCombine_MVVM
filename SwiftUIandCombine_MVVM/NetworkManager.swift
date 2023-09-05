//
//  NetworkManager.swift
//  SwiftUIandCombine_MVVM
//
//  Created by Nfabp10 on 05/09/2023.
//  Basado en ejemplo de Segio Becerril 2020

//Capa de conexion

import Foundation


class NetworkManager {
    
    //Devuelve un array de POST
    func getPosts(dataToReturn: @escaping([Post])->()) {
        
        guard let url = URL (string: "https://jsonplaceholder.typicode.com/posts") else {
            fatalError("Invalid URL, can't access")
        }
        
        URLSession.shared.dataTask(with: url) { datos, respuesta, error in // Closure donde se realiza la llamada al server
            
            guard let data = datos, error == nil, let response = respuesta as? HTTPURLResponse else {
                //si falla sale
                return
            }
            
            if response.statusCode == 200 {
                //Respuesta OK, serializamos los datos...
                
                do {
                    //quiero un arreglo de Posts
                    let posts = try JSONDecoder().decode([Post].self, from : data)
                    dataToReturn(posts)
                } catch let error {
                    print("Error: \(error.localizedDescription)")
                }
                
            }
            
        }.resume()
        
    }
}
