@_private(sourceFile: "ContentView.swift") import CustomViews
import SwiftUI
import SwiftUI

extension ContentView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/ContentView.swift", line: 21)
        ContentView()
    
#sourceLocation()
    }
}

extension ContentView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/ContentView.swift", line: 6)
        ZStack{
            Rectangle()
                .foregroundColor(Color(UIColor.systemBlue))
                .onTapGesture {
                    self.isShow.toggle()
                }
            CustomSheetView(isShow: self.$isShow, isAbleDownGesture: __designTimeBoolean("#111165.[1].[1].property.[0].[0].arg[0].value.[1].arg[1].value", fallback: false)){
                Text(__designTimeString("#111165.[1].[1].property.[0].[0].arg[0].value.[1].arg[2].value.[0].arg[0].value", fallback: "test"))
            }
        }.ignoresSafeArea()
    
#sourceLocation()
    }
}

import struct CustomViews.ContentView
import struct CustomViews.ContentView_Previews
