//
//  Extension.swift
//  ImplementMVVM
//
//  Created by Liliia Neskoromna on 25.11.2020.
//

import UIKit
import Alamofire
import AlamofireImage

// MARK: - Load image

var imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    public func imageFromServerURL(_ urlString: String) {
        self.image = nil
        if let cachedImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cachedImage
            return
        }
        
        AF.request(urlString)
            .responseImage {response in
                if let downloadedImage = try? response.result.get() {
                    imageCache.setObject(downloadedImage, forKey: urlString  as NSString)
                    self.image = downloadedImage
                }
            }
    }
}
