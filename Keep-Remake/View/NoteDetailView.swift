
import SwiftUI

struct NoteDetailView: View {
    
    @ObservedObject var viewModel: NoteViewModel
    var note: Note
    
    @State private var title :String
    @State private var content:String
    
    @FocusState private var focus: FocusedField?
    
    
    init(note:Note,viewModel:NoteViewModel , isFirstEdit:Bool )
    {
        self.note = note
        self.viewModel = viewModel
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
        focus = NoteDetailView.FocusedField.none;
        
    
    }
    
    
    var body: some View {
        VStack {
            TextField("Empty Title", text: $title)
                .focused($focus,equals: .title)
                .padding(0)
                .background(Color.clear)
                .border(Color.clear, width: 0)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.horizontal,20)
                .onSubmit {
                    focus = .content
                }
                .onChange(of: title, { oldValue, newValue in
                    viewModel.updateNote(note: note, title: newValue, content: content)
                })
            TextEditor(text: $content)
                .focused($focus,equals: .content)
                .cornerRadius(8)
                .frame(minHeight: 200)
                .onChange(of: content ,{ oldValue, newValue in
                    viewModel.updateNote(note: note, title: title, content: newValue)
                })
                .padding(.horizontal,16)
        }
        
    }
    
    
    enum FocusedField:Hashable{
        case none,title,content
    }
}

#Preview {
    HomeView()
}
