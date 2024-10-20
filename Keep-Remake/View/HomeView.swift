
import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel = NoteViewModel()
    
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
                    NavigationLink(destination: AddNoteView(viewModel: viewModel))
                    {
                        Image(systemName: "plus")
                            .imageScale(.medium)
                            .font(.title)
                    }
                }
            }
        })
    }
    
    func EmptyView() -> some View {
        VStack(spacing: 20) {
            Image(systemName: "note.text")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .foregroundColor(.gray)
            
            Text("No notes yet!")
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
