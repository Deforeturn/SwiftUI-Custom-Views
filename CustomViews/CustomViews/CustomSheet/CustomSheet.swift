import SwiftUI

struct CustomSheet<V>: View where V:View{
    @Binding var isShow:Bool
    var isAbleDownGesture:Bool? = true
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
    
    enum Style{
        case short, long
    }
    
    var body: some View {
        GeometryReader { proxy in
            Rectangle()
                .frame(width: proxy.size.width,
                       height: proxy.size.height)
                .foregroundColor(Color.black.opacity(self.isShow ? 0.15 : 0))
                .onTapGesture {
                    self.isShow.toggle()
                }
                .overlay(alignment: .bottom, content: {
                    SheetDragable(isAbleDownGesture: self.isAbleDownGesture!) {
                        Rectangle()
                            .frame(height: proxy.size.height/self.heightBias)
                            .foregroundColor(Color(UIColor.systemGroupedBackground))
                            .overlay(self.content())
                            .clipShape(
                                .rect(
                                    topLeadingRadius: 25,
                                    topTrailingRadius: 25
                                )
                            )
                            .offset(y: self.isShow ? 0 : proxy.size.height/self.heightBias)
                    } swipeDown: {
                        self.isShow.toggle()
                    }
                })
                .animation(.aniCurve(0.5, 0), value: self.isShow)
        }
        .ignoresSafeArea()
    }
    
    private func backgroundView() -> some View {
        Rectangle()
            .foregroundColor(Color.black.opacity(self.isShow ? 0.15 : 0))
            .ignoresSafeArea()
            .onTapGesture {
                self.isShow.toggle()
            }
    }
}


//MARK - Example
struct CustomSheetView_Previews: PreviewProvider {
    @State static var isShow = true
    
    static var previews: some View {
        CustomSheetExampleView()
    }
}

struct CustomSheetExampleView: View{
    @State var isShow = true
    
    var body: some View {
        ZStack{
            Text("Main View")
                .foregroundStyle(.red)
            
            CustomSheet(isShow: self.$isShow,
                        isAbleDownGesture: true,
                        style: .long) {
                Text("Inner View")
            }
        }
        .background(.white)
        .onTapGesture {
            self.isShow.toggle()
        }
    }
}
