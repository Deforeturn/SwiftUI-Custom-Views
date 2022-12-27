import SwiftUI

@main
struct CustomViewsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State var isShow = false
    var body: some View {
        ZStack{
            List{
                ForEach(0..<25){ i in
                    Text("\(i)")
                }
            }
            .onTapGesture {
                self.isShow.toggle()
            }
            CustomSheetView(isShow: self.$isShow, isAbleDownGesture: false){
                Text("test")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
