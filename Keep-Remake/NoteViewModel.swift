
import Foundation

class NoteViewModel: ObservableObject {
    
    @Published var notes: [Note] = []{
        didSet {
            saveNotes()
        }
    }
    
    init() {
        copyInitialNotesIfNeeded()
        loadNotesFromFile()
    }
    
    func addNote(title:String,content:String)
    {
        let newNote = Note(title: title, content: content,
                           createdAt: Date(), updatedAt: Date())
        
        notes.append(newNote)
    }
    
    func updateNote(note:Note,title:String,content:String)
    {
        if let index = notes.firstIndex(where: {$0.id == note.id })
        {
            notes[index].title = title
            notes[index].content = content
            notes[index].updatedAt = Date()
        }
    }
    
    func deleteNote(note:Note)
    {
        if let index = notes.firstIndex(where: {$0.id == note.id })
        {
            notes.remove(at: index)
        }
    }
    
    
    
    
    // Data File
    
    private func getDocumentDirectory() -> URL{
        FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    }
    
    private func getNotesFileURL() -> URL{
        return getDocumentDirectory().appendingPathComponent("notes.json")
    }
    
    private func copyInitialNotesIfNeeded() {
        let fileManager = FileManager.default
        let notesFileURL = getNotesFileURL()
        
        if !fileManager.fileExists(atPath: notesFileURL.path) {
            if let bundleURL = Bundle.main.url(forResource: "notes", withExtension: "json") {
                do {
                    try fileManager.copyItem(at: bundleURL, to: notesFileURL)
                    print("Initial notes.json copied to Documents directory")
                } catch {
                    print("Error copying initial notes.json: \(error)")
                }
            }
        }
    }
    
    private  func saveNotes() {
        let url = getNotesFileURL()
        do {
            let data = try JSONEncoder().encode(notes)  // 將筆記數據編碼為 JSON
            try data.write(to: url)  // 將編碼後的數據寫入文件
        } catch {
            print("Error saving notes: \(error)")
        }
    }
    
    // 從文件加載筆記
    private func loadNotesFromFile() {
        let url = getNotesFileURL()
        if let data = try? Data(contentsOf: url) {
            do {
                let decoder = JSONDecoder()
                notes = try decoder.decode([Note].self, from: data)  // 解碼 JSON 並將其轉換為 Note 列表
            } catch {
                print("Error loading notes: \(error)")
            }
        } else {
            print("No saved notes found.")
        }
    }
    
    
}
