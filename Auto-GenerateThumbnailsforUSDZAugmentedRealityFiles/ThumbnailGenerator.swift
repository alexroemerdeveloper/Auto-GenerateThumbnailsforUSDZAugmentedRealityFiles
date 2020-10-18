//
//  ThumbnailGenerator.swift
//  Auto-GenerateThumbnailsforUSDZAugmentedRealityFiles
//
//  Created by Alexander Römer on 18.10.20.
//

import SwiftUI
import QuickLookThumbnailing
import Combine
import UIKit

class ThumbnailGenerator: ObservableObject {
    
    @Published var thumbnailImage: Image?
    
    func generateThumbnail(for resource: String, withExtension: String = "usdz", size: CGSize) {
        guard let url = Bundle.main.url(forResource: resource, withExtension: withExtension) else {
            print("unable to create url for resource.")
            return
        }
        
        let scale = UIScreen.main.scale
        let request = QLThumbnailGenerator.Request(fileAt: url, size: size, scale: scale, representationTypes: .all)
        let generator = QLThumbnailGenerator.shared
        generator.generateBestRepresentation(for: request) { (thumbnail, error) in
            DispatchQueue.main.async {
                if thumbnail == nil || error != nil {
                    print("Error generating thumbnail")
                    return
                } else {
                    self.thumbnailImage = Image(uiImage: thumbnail!.uiImage)
                }
            }
        }
    }
    
}

