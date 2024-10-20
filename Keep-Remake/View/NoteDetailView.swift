
import SwiftUI

struct NoteDetailView: View {
    
    @ObservedObject var viewModel: NoteViewModel
    var note: Note
    @State private var title :String
    @State private var content:String
    
    init(note:Note,viewModel:NoteViewModel)
    {
        self.note = note
        self.viewModel = viewModel
        _title = State(initialValue: note.title)
        _content = State(initialValue: note.content)
    }
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Title").font(.headline)) {
                    TextField("Enter title", text: $title)
                        .padding()
                        .cornerRadius(8)
                        .onChange(of: title, {  oldValue, newValue in
                            viewModel.updateNote(note: note, title: newValue, content: content)
                        })
                }
                
                Section(header: Text("Content").font(.headline)) {
                    TextEditor(text: $content)
                        .padding(.vertical,5)
                        .cornerRadius(8)
                        .frame(minHeight: 300)
                        .onChange(of: content ,{ oldValue, newValue in
                            viewModel.updateNote(note: note, title: title, content: newValue)
                        } )
                }
            }
            .background(Color(UIColor.systemBackground))
        
        }
        .navigationTitle(title)
     
        
    }
}

#Preview {
    HomeView()
}
