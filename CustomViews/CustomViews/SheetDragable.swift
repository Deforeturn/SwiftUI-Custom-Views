import SwiftUI

struct SheetDragable<V>:View  where V:View{
    var content: () -> V
    
    @State private var position: CGSize = .zero
    
    var body: some View{
        let drag = DragGesture()
            .onChanged { value in
                let width = value.translation.width/10
                var height = value.translation.height
                if height < 0 {height /= 10}
                
                self.position.width = width
                self.position.height = height
            }
            .onEnded { value in
                print("end - \(value.translation)\n")
                withAnimation(.easeOut(duration: 0.35)){
                    self.position = .zero
                }
            }
        content()
            .offset(x: position.width, y: position.height)
            .gesture(drag)
    }
}

//Example
//SheetDragable{
//    Rectangle()
//        .frame(width: 350, height: 400)
//        .cornerRadius(15)
//}

