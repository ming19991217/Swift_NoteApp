//
//  Home.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/19.
//

import SwiftUI

struct Home: View {
    
    @State private var datas = [
        ItemData( imgString: "img-10",title: "政經孫老",content: "大家好我是孫老"),
        ItemData( imgString: "img-1"),
        ItemData( imgString: "img-2"),
        ItemData( imgString: "img-3"),
        ItemData( imgString: "img-4"),
        ItemData( imgString: "img-5"),
        ItemData( imgString: "img-6"),
        ItemData( imgString: "img-7"),
        ItemData( imgString: "img-8"),
        ItemData( imgString: "img-9"),
        
        ItemData( imgString: "img-10",title: "政經孫老",content: "大家好我是孫老"),
        ItemData( imgString: "img-1"),
        ItemData( imgString: "img-2"),
        ItemData( imgString: "img-3"),
        ItemData( imgString: "img-4"),
        ItemData( imgString: "img-5"),
        ItemData( imgString: "img-6"),
        ItemData( imgString: "img-7"),
        ItemData( imgString: "img-8"),
        ItemData( imgString: "img-9"),
    ]
    
    var body: some View {
        NavigationView(content: {
            VStack(content:{
                
                MasonryLayout_Test()
                    .padding(.top,10)
                
                //                Spacer()
                
                //                BottomBar()
                
            })
            .navigationTitle("Home")
//            .toolbar{
//                ToolbarItemGroup(placement: .bottomBar)
//                {
//                    let newData = addItemData()
//                    datas.append(newData)
//                    
//                    return  NavigationLink(destination: DetailPage(isEditing: true, itemData: $datas[datas.count-1]))
//                    {
//                        Image(systemName: "square.and.pencil")
//                            .imageScale(.large)
//                    }
//                }
//            }
        } )
    }
    
    
    func addItemData() -> ItemData
    {
        let data = ItemData(imgString: "img-1",title: "新建標題",content: "新增文字")
        datas.append(data)
        return data
    }
    
}


#Preview {
    Home()
}
