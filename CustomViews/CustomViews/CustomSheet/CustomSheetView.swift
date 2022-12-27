//Example
//CustomSheetView(isShow: self.$isShow, isAbleDownGesture: false){
//    Text("test")
//}

import SwiftUI

struct CustomSheetView<V>: View where V:View{
    let width = UIWindow().screen.bounds.width
    let height = UIWindow().screen.bounds.height
    @Binding var isShow:Bool
    var isAbleDownGesture:Bool? = true // If this value is true and the user swipes downward, the sheet will close.
    var style:Style? = .short
    var content : () -> V
    var heightBias: CGFloat{
        switch self.style{
        case .short:
            return 2.0
        case .long:
            return 1.25
        case .none:
            return 2.0
        }
    }
    
    var body: some View {
        Rectangle()
            .frame(width: self.width,
                   height: self.height)
            .foregroundColor(Color.black.opacity(self.isShow ? 0.15 : 0))
            .ignoresSafeArea()
            .onTapGesture {
                self.isShow.toggle()
            }
            .overlay(alignment: .bottom, content: {
                SheetDragable(isAbleDownGesture: self.isAbleDownGesture!) {
                    Rectangle()
                        .frame(height: self.height/self.heightBias)
                        .foregroundColor(Color(UIColor.systemGroupedBackground))
                        .cornerRadius(25)
                        .overlay(self.content())
                        .offset(y: self.isShow ? 0 : self.height/self.heightBias)
                        
                } swipeDown: {
                    self.isShow.toggle()
                }
            })
            .animation(.aniCurve(0.5, 0), value: self.isShow)
    }
    
    enum Style{
        case short, long
    }
}


