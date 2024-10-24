
import SwiftUI

struct NoteDetailView: View {
    
    @ObservedObject var viewModel: NoteViewModel
    var note: Note
    
    @State private var title :String
    @State private var content:String
    
    
    init(note:Note,viewModel:NoteViewModel , isFirstEdit:Bool )
    {
        self.note = note
        self.viewModel = viewModel
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
    }
    
    
    var body: some View {
        TextField("Empty Title", text: $title)
            .padding(0)
            .background(Color.clear)
            .border(Color.clear, width: 0)
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.primary)
            .padding(.horizontal,20)
            .onChange(of: title, { oldValue, newValue in
                viewModel.updateNote(note: note, title: newValue, content: content)
            } )
        
        VStack {
            TextEditor(text: $content)
                .cornerRadius(8)
                .frame(minHeight: 200)
                .onChange(of: content ,{ oldValue, newValue in
                    viewModel.updateNote(note: note, title: title, content: newValue)
                })
                .padding(.horizontal,20)
        }
    }
}

#Preview {
    HomeView()
}
