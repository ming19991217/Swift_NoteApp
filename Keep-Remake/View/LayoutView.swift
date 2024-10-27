//
//  LayoutView.swift
//  Keep-Remake
//
//  Created by Ming on 2024/10/20.
//

import SwiftUI

struct LayoutView: View {
    
    @ObservedObject var viewModel: NoteViewModel
    var notes: [Note]
    
    let spacing: CGFloat = 8
    let columnCount: Int = 2
    
    
    init(viewModel: NoteViewModel) {
        self.viewModel=viewModel
        notes=viewModel.notes
    }
    
    
    var body: some View {
        let columns = distributeItems(items: notes, columns: columnCount)
        
        ScrollView{
            HStack(alignment:.top , spacing:spacing) {
                ForEach(0 ..< columns.count, id: \.self) { index in
                    LazyVStack(alignment: .leading, spacing: spacing){
                        ForEach(columns[index]){ note in
                            
                            NavigationLink(destination: NoteDetailView(note: note, viewModel: viewModel,isFirstEdit: false))
                            {
                                NoteItemView(note: note)
                                    .contextMenu{
                                        Button (role:.destructive ){
                                            viewModel.deleteNote(note: note)
                                        } label: {
                                            Label("Delete", systemImage: "trash")
                                        }
                                    }
                            }
                            
                        }
                        
                    }
                }
            }
            .padding(.horizontal,spacing)
        }
        
    }
    
    
    
    private func distributeItems(items: [Note], columns: Int) -> [[Note]] {
        var distributedItems = Array(repeating: [Note](), count: columns)
        var columnHeights = Array(repeating: 0.0, count: columns) // 用於記錄每列的高度
        
        for item in items {
            // 假設文本長度大致等於高度，這裡根據內文長度簡單計算高度
            let itemHeight = Double(item.content.count) * 0.5 + 50
            
            // 找到當前高度最小的列，將項目分配給該列
            if let minIndex = columnHeights.firstIndex(of: columnHeights.min() ?? 0) {
                distributedItems[minIndex].append(item)
                columnHeights[minIndex] += itemHeight
            }
        }
        
        return distributedItems
    }
    
}

struct NoteItemView : View{
    
    var note: Note
    
    var body: some View{
        VStack(alignment: .leading, spacing: 8) {
            
            Text(note.title)
                .foregroundStyle(Color.primary)
                .font(.headline)
                .fontWeight(.bold)
                .lineLimit(2) // 限制標題最多顯示兩行
                .multilineTextAlignment(.leading)
            
            Text(note.content)
                .foregroundStyle(Color.primary.opacity(0.8))
                .lineSpacing(4) // 增加行間距
                .lineLimit(8) // 限制最多顯示五行文字
                .font(.caption)
                .multilineTextAlignment(.leading)
            
        }
        .frame(maxWidth: .infinity,alignment: .leading)
        .padding()
        .background(Color(UIColor.secondarySystemBackground))
        .cornerRadius(10)
    }
}

#Preview {
    HomeView()
}
