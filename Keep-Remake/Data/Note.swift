
import Foundation

struct Note:Identifiable ,Codable{
    var id = UUID()
    var title:String
    var content:String
    var createdAt:Date
    var updatedAt:Date
}


func GetNotes()->[Note] {
    var notes : [Note] = [Note]()
    
    if let url = Bundle.main.url(forResource: "notes", withExtension: "json")
    {
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            decoder.dateDecodingStrategy = .iso8601 // ISO 8601 日期格式
            notes = try decoder.decode([Note].self, from: data)
        } catch {
            print("Error loading notes: \(error)")
        }
    }
    
    return notes
    
}
