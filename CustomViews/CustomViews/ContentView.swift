import SwiftUI

struct ContentView: View {
    @State var isShow = false
    var body: some View {
        ZStack{
            Rectangle()
                .foregroundColor(Color(UIColor.systemBlue))
                .onTapGesture {
                    self.isShow.toggle()
                }
            CustomSheetView(isShow: self.$isShow, isAbleDownGesture: false){
                Text("test")
            }
        }.ignoresSafeArea()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
