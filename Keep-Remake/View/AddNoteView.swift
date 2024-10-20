import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.dismiss) var dismiss
    @ObservedObject var viewModel: NoteViewModel
    @State private var title: String = "New Note"
    @State private var content: String = ""
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Title").font(.headline)) {
                    TextField("Enter title", text: $title)
                        .padding()
                        .cornerRadius(8)
                }
                
                Section(header: Text("Content").font(.headline)) {
                    TextEditor(text: $content)
                        .padding(.vertical,5)
                        .cornerRadius(8)
                        .frame(minHeight: 200)
                }
            }
            .background(Color(UIColor.systemBackground))
        }
        .navigationTitle(title)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button("Save"){
                    viewModel.addNote(title: title, content: content)
                    dismiss()
                }
            }
        }
    }
  
}
