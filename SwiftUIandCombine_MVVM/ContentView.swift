//
//  ContentView.swift
//  SwiftUIandCombine_MVVM
//
//  Created by Nfabp10 on 05/09/2023.
//

//Vista

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var model = PostViewModel()
    
    var body: some View {
        
        VStack {
            
            List(model.posts){ post in
                Text(post.title)
            }
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
