//
//  ImageCache.swift
//  SugarBox
//
//  Created by Suresh Kumar Linganathan on 22/10/23.
//

import Foundation

import UIKit

class ImageCache {
    static let shared = ImageCache()
    
    private init() {
        let memoryCapacity = 100 * 1024 * 1024 // 100MB
        let diskCapacity = 100 * 1024 * 1024 // 100MB
        let cache = URLCache(memoryCapacity: memoryCapacity, diskCapacity: diskCapacity, diskPath: "imageCache")
        URLCache.shared = cache
    }
    
    func loadImage(urlStr: String, completion: @escaping (UIImage?) -> Void) {
        
        guard let url =  URL(string: urlStr) else {
            return
        }
        if let cachedResponse = URLCache.shared.cachedResponse(for: URLRequest(url: url)) {
            let image = UIImage(data: cachedResponse.data)
            completion(image)
        } else {
            URLSession.shared.dataTask(with: url) { (data, _, error) in
                if let data = data {
                    let response = URLResponse(url: url, mimeType: "image/jpeg", expectedContentLength: data.count, textEncodingName: nil)
                    let cachedResponse = CachedURLResponse(response: response, data: data)
                    URLCache.shared.storeCachedResponse(cachedResponse, for: URLRequest(url: url))
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        completion(image)
                    }
                } else {
                    DispatchQueue.main.async {
                        completion(nil)
                    }
                }
            }.resume()
        }
    }
}
