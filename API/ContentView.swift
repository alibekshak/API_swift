import SwiftUI
import Moya

struct ContentView: View {
    @State private var imageData: Data?
    
    var body: some View {
        VStack {
            if let imageData = imageData, let uiImage = UIImage(data: imageData) {
                Image(uiImage: uiImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            } else {
                Text("Loading...")
            }
        }
        .padding()
        .onAppear {
            fetchMeme()
        }
    }
    
    func fetchMeme() {
        let provider = MoyaProvider<Meme>()
        
        provider.request(.getMeme(name: "Tears-Of-Joy", topText: "Homework", bottomText: "Done")) { result in
            switch result {
            case .success(let response):
                self.imageData = response.data
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

