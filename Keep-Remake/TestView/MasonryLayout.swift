import SwiftUI

struct MasonryLayout_Test:View {
    var body: some View {
        
        let dataList = [
            ItemData( imgString: "img-10",title: "政經孫老",content: "大家好我是孫老"),
            ItemData( imgString: "img-1"),
            ItemData( imgString: "img-2"),
            ItemData( imgString: "img-3"),
            ItemData( imgString: "img-4"),
            ItemData( imgString: "img-5"),
            ItemData( imgString: "img-6"),
            ItemData( imgString: "img-7"),
            ItemData( imgString: "img-8"),
            ItemData( imgString: "img-9"),
            
            
            ItemData( imgString: "img-10",title: "政經孫老",content: "大家好我是孫老"),
            ItemData( imgString: "img-1"),
            ItemData( imgString: "img-2"),
            ItemData( imgString: "img-3"),
            ItemData( imgString: "img-4"),
            ItemData( imgString: "img-5"),
            ItemData( imgString: "img-6"),
            ItemData( imgString: "img-7"),
            ItemData( imgString: "img-8"),
            ItemData( imgString: "img-9"),
            
        ]
        
        return MasonryLayout(gridItems:dataList, numOfColumns: 2)
    }
}

struct ItemData:Identifiable{
    let id = UUID()
    let imgString:String
    var title:String = "Title"
    var content:String = "Content"
}


struct MasonryLayout : View {
    
    struct Column:Identifiable{
        let id = UUID()
        var gridItems = [ItemData]()
    }
    
    let columns:[Column]
    let spacing:CGFloat
    let horizontalPadding:CGFloat
    
    init(gridItems:[ItemData],numOfColumns:Int,
         spacing:CGFloat=20,horizontalPadding:CGFloat=20)
    {
        self.spacing = spacing
        self.horizontalPadding = horizontalPadding
        
        var columns = [Column]()
        for _ in 0..<numOfColumns {
            columns.append(Column())
        }
        
        var columnHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
        
        for gridItem in gridItems {
            
            // 找最短的那排
            var smallestColumnIndex = 0
            var smallestHeight = columnHeight.first!
            for i in 1 ..< columnHeight.count{
                let curHeight = columnHeight[i]
                
                print("\(smallestColumnIndex):\(curHeight) / \(i):\(smallestHeight)")
                
                if curHeight < smallestHeight
                {
                    smallestHeight = curHeight
                    smallestColumnIndex = i
                }
            }
            
            
            // 排序進排列
            columns[smallestColumnIndex].gridItems.append(gridItem)
            
            
            let imgHeight = calculateItemHeight(item: gridItem)
            columnHeight[smallestColumnIndex] += imgHeight
            
        }
        
        
        print("////")
        for i in columns{
            print(i.gridItems.count)
            
        }
        
        self.columns = columns
        
        func calculateItemHeight(item:ItemData) -> CGFloat
        {
            if let img = UIImage(named:item.imgString)
            {
                return img.size.height
            }
            
            print("Image not found: \(item.imgString)")
            return 0;
        }
        
    }
    
    var body: some View {
        ScrollView{
            HStack(alignment:.top , spacing:spacing) {
                ForEach(columns){ column in
                    LazyVStack(spacing: spacing) {
                        ForEach(column.gridItems){ gridItem in
                            NavigationLink(destination: DetailPage(itemData: gridItem))
                            {
                                Test_Item(data:gridItem)
                            }
                        }
                    }
                }
            }
            .padding(.horizontal,horizontalPadding)
            .onAppear{
                print(columns.count )
                
                for i in columns{
                    print(i.gridItems.count)
                    
                }
                
            }
        }
        
    }
    
    
}


#Preview {
    Home()
    
}
