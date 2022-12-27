@_private(sourceFile: "CustomSheetView.swift") import CustomViews
import SwiftUI
import SwiftUI

extension CustomSheetView_Previews {
    @_dynamicReplacement(for: previews) private static var __preview__previews: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/CustomSheet/CustomSheetView.swift", line: 60)
        CustomSheetView(isShow: Binding.constant(__designTimeBoolean("#111305.[2].[0].property.[0].[0].arg[0].value.arg[0].value", fallback: true)), style: .short){
            Text(__designTimeString("#111305.[2].[0].property.[0].[0].arg[2].value.[0].arg[0].value", fallback: "Test"))
        }.previewLayout(.fixed(width: __designTimeInteger("#111305.[2].[0].property.[0].[0].modifier[0].arg[0].value.arg[0].value", fallback: 500), height: __designTimeInteger("#111305.[2].[0].property.[0].[0].modifier[0].arg[0].value.arg[1].value", fallback: 1000)))
            
    
#sourceLocation()
    }
}

extension CustomSheetView {
    @_dynamicReplacement(for: body) private var __preview__body: some View {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/CustomSheet/CustomSheetView.swift", line: 29)
        Rectangle()
            .frame(width: self.width,
                   height: self.height)
            .foregroundColor(Color.black.opacity(self.isShow ? __designTimeFloat("#111305.[1].[7].property.[0].[0].modifier[1].arg[0].value.modifier[0].arg[0].value.then", fallback: 0.15) : __designTimeInteger("#111305.[1].[7].property.[0].[0].modifier[1].arg[0].value.modifier[0].arg[0].value.else", fallback: 0)))
            .ignoresSafeArea()
            .onTapGesture {
                self.isShow.toggle()
            }
            .overlay(alignment: .bottom, content: {
                SheetDragable(isAbleDownGesture: self.isAbleDownGesture!) {
                    Rectangle()
                        .frame(height: self.height/self.heightBias)
                        .foregroundColor(Color(UIColor.systemGroupedBackground))
                        .cornerRadius(__designTimeInteger("#111305.[1].[7].property.[0].[0].modifier[4].arg[1].value.[0].arg[1].value.[0].modifier[2].arg[0].value", fallback: 25))
                        .overlay(self.content())
                        .offset(y: self.isShow ? __designTimeInteger("#111305.[1].[7].property.[0].[0].modifier[4].arg[1].value.[0].arg[1].value.[0].modifier[4].arg[0].value.[0]", fallback: 0) : self.height/self.heightBias)
                        
                } swipeDown: {
                    self.isShow.toggle()
                }
            })
            .animation(.aniCurve(__designTimeFloat("#111305.[1].[7].property.[0].[0].modifier[5].arg[0].value.arg[0].value", fallback: 0.5), __designTimeInteger("#111305.[1].[7].property.[0].[0].modifier[5].arg[0].value.arg[1].value", fallback: 0)), value: self.isShow)
    
#sourceLocation()
    }
}

extension CustomSheetView {
    @_dynamicReplacement(for: heightBias) private var __preview__heightBias: CGFloat {
        #sourceLocation(file: "/Users/mrsbok/Documents/swiftui-custom-views/CustomViews/CustomViews/CustomSheet/CustomSheetView.swift", line: 18)
        switch self.style{
        case .short:
            return __designTimeFloat("#111305.[1].[6].property.[0].[0].[0].[0]", fallback: 2.0)
        case .long:
            return __designTimeFloat("#111305.[1].[6].property.[0].[0].[1].[0]", fallback: 1.25)
        case .none:
            return __designTimeFloat("#111305.[1].[6].property.[0].[0].[2].[0]", fallback: 2.0)
        }
    
#sourceLocation()
    }
}

import struct CustomViews.CustomSheetView
import struct CustomViews.CustomSheetView_Previews
