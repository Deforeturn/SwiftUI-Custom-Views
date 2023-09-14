import SwiftUI

struct SheetDragable<V>:View  where V:View{
    var isAbleDownGesture:Bool
    var content: () -> V
    var swipeDown: () -> ()
    @State private var position: CGSize = .zero
    @State var toEnd = false
    
    var body: some View {
        let drag = DragGesture()
            .onChanged { value in
                let width = value.translation.width/15
                var height = value.translation.height
                if height < 0 || self.isAbleDownGesture == false {height /= 15}
                self.position.width = width
                self.position.height = height
                if self.isAbleDownGesture && value.predictedEndTranslation.height >= value.startLocation.y + 250{
                    self.toEnd = true
                }else{
                    self.toEnd = false
                }
            }
            .onEnded { _ in
                withAnimation(.aniCurve(0.5, 0)){
                    self.position = .zero
                }
                
                if self.toEnd{
                    self.swipeDown()
                }
            }
        content()
            .offset(x: position.width, y: position.height)
            .gesture(drag)
    }
}
