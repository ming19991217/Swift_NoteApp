
import SwiftUI

struct Test_Item: View {
    
    let data: ItemData
    
    var body: some View {
        Image(data.imgString)
            .resizable()
            .scaledToFit()
            .clipShape(RoundedRectangle(cornerRadius: 13))
    }
}

