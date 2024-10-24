//
//  Keep_RemakeApp.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/17.
//

import SwiftUI

@main
struct Keep_RemakeApp: App {
    var body: some Scene {
        WindowGroup {
            ZStack{
                Color.black.ignoresSafeArea()
                HomeView()
            }
        }
       
        
    }
}

