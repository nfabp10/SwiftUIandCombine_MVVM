//
//  Post.swift
//  SwiftUIandCombine_MVVM
//
//  Created by Nfabp10 on 05/09/2023.
//

//Seria el Modelo
import Foundation

struct Post: Codable, Hashable, Identifiable {
    let id = UUID()
    let title: String
    let body: String
}
