@_private(sourceFile: "ContentView.swift") import CustomViews
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/ContentView.swift", line: 24)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/ContentView.swift", line: 14)
        SheetDragable{
            Rectangle()
                .frame(width: __designTimeInteger("#5991.[2].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[0].value", fallback: 350), height: __designTimeInteger("#5991.[2].[0].property.[0].[0].arg[0].value.[0].modifier[0].arg[1].value", fallback: 400))
                .cornerRadius(__designTimeInteger("#5991.[2].[0].property.[0].[0].arg[0].value.[0].modifier[1].arg[0].value", fallback: 25))
        }
    
#sourceLocation()
    }
}

import struct CustomViews.CustomViewsApp
import struct CustomViews.ContentView
import struct CustomViews.ContentView_Previews
