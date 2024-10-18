//
//  Home.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/19.
//

import SwiftUI

struct Home: View {
    var body: some View {
        NavigationView(content: {
            VStack(content:{
                MasonryLayout_Test()
                    .padding(.top,10)
            })
            .navigationTitle("Home")
        })
      
    }
}


#Preview {
    Home()
}
