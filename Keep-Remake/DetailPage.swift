//
//  DetailPage.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/19.
//

import SwiftUI

struct DetailPage: View {
    
    let data:ItemData
    
    var body: some View {
            ScrollView(){
                VStack(alignment: .leading, spacing:10){
                    
                    
                    Image(data.imgString)
                        .resizable()
                        .scaledToFill()
                        .frame(width:300,height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 13))
                        .clipped()
                        .padding(.top,100)
                    
                    Text(data.title)
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    
                    Text(data.content)
                        .font(.body)
                }
                
            }
            
    }
    
}

#Preview {
    DetailPage(data:ItemData( imgString: "img-1"))
}
