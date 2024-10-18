
import SwiftUI

struct GridItem: View {
    
    let data: ItemData
    
    var body: some View {
        NavigationLink(destination:DetailPage(data: data))
        {
            Image(data.imgString)
                .resizable()
                .scaledToFit()
                .clipShape(RoundedRectangle(cornerRadius: 13))
        }
    }
}

