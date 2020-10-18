//
//  ContentView.swift
//  Auto-GenerateThumbnailsforUSDZAugmentedRealityFiles
//
//  Created by Alexander Römer on 18.10.20.
//

import SwiftUI

struct ContentView: View {

    @StateObject private var thumbnailGenerator = ThumbnailGenerator()
    private let placeHolderImage = Image(systemName: "photo")
    
    var body: some View {
        VStack {
            Text("USDZ Thumbnail!")
                .font(.largeTitle)
                .bold()
                .padding()
            
            self.thumbnailGenerator.thumbnailImage != nil ? self.thumbnailGenerator.thumbnailImage!.resizable()                .aspectRatio(1/1, contentMode: .fit)
                .padding() : placeHolderImage
                .resizable()
                .aspectRatio(1/1, contentMode: .fit)
                .padding()
            
            
            Button(action: {
                self.thumbnailGenerator.generateThumbnail(for: "tv_retro", size: CGSize(width: 400, height: 400))
            }) {
                Text("Generate")
                    .fontWeight(.semibold)
                    .padding()
            }

        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
