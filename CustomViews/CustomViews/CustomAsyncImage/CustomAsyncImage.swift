import SwiftUI

struct CustomAsynsImage<P>:View where P:View{
    var urlStr:String
    var placeHolderView:() -> P
    
    @State var imageView:Image?
    
    init(_ urlStr:String,_ placeHolderView: @escaping () -> P) {
        self.urlStr = urlStr
        self.placeHolderView = placeHolderView
    }
    
    var body: some View{
        VStack{
            if self.imageView != nil{
                self.imageView?
                    .resizable()
                    .scaledToFit()
            }else{
                self.placeHolderView()
                    .onAppear{
                        self.loadImage()
                    }
            }
        }
    }
    
    private func loadImage(){
        let url = URL(string: self.urlStr)
        let urlRequest = URLRequest(url: url!)
        URLSession.shared.dataTask(with: urlRequest){ data, url, error in
            guard let data = data, error == nil else {return}
            Thread.sleep(forTimeInterval: .init(1))
            self.imageView = Image(uiImage: UIImage(data: data)!)
        }.resume()
    }
}

//MARK: - Example
struct CustomAsynsImage_Previews: PreviewProvider {
    static var previews: some View {
        VStack{
            CustomAsynsImage(.urlCar){
                Text("Loading...")
            }
        }
    }
}
