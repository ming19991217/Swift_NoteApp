import SwiftUI

struct AddNoteView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var viewModel: NoteViewModel
    @State private var title: String = ""
    @State private var content: String = ""
    
    @FocusState private var focus : FocusedField?
    
    
    
    var body: some View {
        
        VStack {
            
            TextField("Enter title", text: $title)
                .submitLabel(.next)
                .focused($focus,equals: .title)
                .lineLimit(1)
                .frame(height: 50)
                .padding(0)
                .background(Color.clear)
                .border(Color.clear, width: 0)
                .font(.largeTitle)
                .fontWeight(.bold)
                .foregroundColor(.primary)
                .padding(.horizontal,20)
                .padding(.top,20)
                .onSubmit {
                    focus = .content
                }
            VStack {
                TextEditor(text: $content)
                    .focused($focus,equals: .content)
                    .cornerRadius(8)
                    .frame(minHeight: 100)
                    .padding(.horizontal,20)
                    .onChange(of: content) {oldValue, newValue in
                        if newValue.isEmpty {
                            focus = .title
                        }
                    }
            }
            
            Button{
                viewModel.addNote(title: title, content: content)
                presentationMode.wrappedValue.dismiss()
            } label: {
                Text("Done")
                    .frame(width:150,height: 10)
                    .font(.headline)
                    .fontWeight(.bold)
                    .padding()
                    .background(Color.white)
                    .foregroundColor(.black)
                    .cornerRadius(8)
            }
            
        }
        .padding(20)
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5){
                focus = .title
            }
        }
        
        
    }
    
    enum FocusedField:Hashable{
        case title,content
    }
    
}

#Preview {
    HomeView()
}
