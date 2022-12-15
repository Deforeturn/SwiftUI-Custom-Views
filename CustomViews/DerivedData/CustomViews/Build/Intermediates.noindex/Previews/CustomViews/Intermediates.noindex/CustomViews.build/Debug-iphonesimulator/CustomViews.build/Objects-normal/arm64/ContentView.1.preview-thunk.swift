@_private(sourceFile: "ContentView.swift") import CustomViews
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/ContentView.swift", line: 22)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/ContentView.swift", line: 14)
        CustomAsynsImage(.urlCar){
            Text(__designTimeString("#5991.[2].[0].property.[0].[0].arg[1].value.[0].arg[0].value", fallback: "Loading..."))
        }
    
#sourceLocation()
    }
}

import struct CustomViews.CustomViewsApp
import struct CustomViews.ContentView
import struct CustomViews.ContentView_Previews
