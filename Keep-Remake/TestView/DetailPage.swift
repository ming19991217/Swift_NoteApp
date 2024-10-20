//
//  DetailPage.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/19.
//

import SwiftUI

struct DetailPage: View {
    
    @State var isEditing:Bool = false
     var itemData : ItemData
    
    var body: some View {
        ScrollView(){
            if isEditing{
                EditorView(data: itemData)
            }
            else {
                ReadOnlyView(data: itemData)
            }
        }
        .toolbar()
        {
            Button(action: {
                isEditing = !isEditing
            }) {
                Image(systemName: "pencil.circle")
                    .imageScale(.large)
            }
        }
    }
    
    
    struct ReadOnlyView: View {
        let data:ItemData
        
        var body: some View{
            VStack(alignment: .leading, spacing:10){
                Image(data.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width:300)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .clipped()
                    .padding(.top,50)
                
                Text(data.title)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                
                Text(data.content)
                    .font(.body)
            }
        }
        
    }
    
    struct EditorView: View {
       var data: ItemData // 使用 Binding 以便更新數據
        
        var body: some View {
            VStack(alignment: .leading, spacing: 10) {
                // 圖片部分
                Image(data.imgString)
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 13))
                    .clipped()
                    .padding(.top, 50)
                
                // 編輯標題的 TextField，保持與 ReadOnlyView 一致的外觀
//                TextField("標題", text: data.title)
//                    .font(.largeTitle)
//                    .fontWeight(.bold)
//                    .padding([.leading, .trailing], 0)
//                    .background(Color.clear) // 保持透明背景，和普通文字視覺一致
//                
//                // 編輯內容的 TextEditor，外觀與 ReadOnlyView 保持一致
//                TextEditor(text: data.content)
//                    .font(.body)
//                    .frame(height: 200)
//                    .padding(.horizontal)
//                    .border(Color.gray.opacity(0.2), width: 1) // 添加輕微邊框區分可編輯區域
            }
            .padding(.horizontal)
        }
    }
    
}



