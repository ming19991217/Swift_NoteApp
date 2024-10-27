
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = NoteViewModel()
    
    @State private var isPresented: Bool = false
    
    
    var body: some View {
        NavigationView(content: {
            VStack{
                if viewModel.notes.isEmpty{
                    EmptyView()
                }
                else{
                    LayoutView(viewModel: viewModel)
                }
            }
            .navigationTitle("Notes")
            .toolbar{
                ToolbarItem(placement: .bottomBar) {
                    Spacer()
                }
                ToolbarItem(placement: .bottomBar){
                    Button {
                         isPresented = true
                     } label: {
                         ZStack {
                             // 按鈕背景設計
                             RoundedRectangle(cornerRadius: 90, style: .continuous)
                                 .fill(Color.primary.opacity(0.9))
                                 .frame(width: 50, height: 50)
                                 .shadow(color: Color.black.opacity(0.2), radius: 5, x: 0, y: 3) // 增加陰影效果

                             
                             // 按鈕圖標設計
                             Image(systemName: "plus")
                                 .foregroundColor(Color(UIColor.secondarySystemBackground))
                                 .imageScale(.medium)
                                 .font(.title2)
                                 .fontWeight(.bold)
                         }
                         .padding(.trailing,10)
                         .padding(.bottom,40)
                     }
                }
            }
            .toolbarBackground(.clear, for: .bottomBar)
            .toolbarBackground(.hidden, for: .bottomBar)
            .sheet(isPresented: $isPresented, content: {
                AddNoteView(viewModel: viewModel)
                    .presentationDragIndicator(.visible) // 顯示拉條
            })
        })
        
        
    }
    
    func EmptyView() -> some View {
        VStack(spacing: 20) {
            Image(systemName: "note.text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .foregroundColor(.gray)
            
            Text("No notes yet")
                .font(.title)
                .fontWeight(.semibold)
                .foregroundColor(.gray)
            
            Text("Tap the + button to add your first note!")
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}


#Preview {
    HomeView()
}
