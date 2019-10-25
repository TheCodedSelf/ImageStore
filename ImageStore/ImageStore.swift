//
//  ImageStore.swift
//  ImageStore
//
//  Created by Keegan Rush on 2017/09/27.
//  Copyright © 2017 thecodedself. All rights reserved.
//

import Foundation

struct ImageStore {
    
    static func delete(imageNamed name: String) {
        guard let imagePath = ImageStore.path(for: name) else {
            return
        }
        
        try? FileManager.default.removeItem(at: imagePath)
    }
    
    static func retrieve(imageNamed name: String) -> UIImage? {
        guard let imagePath = ImageStore.path(for: name) else {
            return nil
        }
        
        return UIImage(contentsOfFile: imagePath.path)
    }
    
    static func store(image: UIImage, name: String) throws {
        
        guard let imageData = image.pngData() else {
            throw NSError(description: "The image could not be created")
        }
        
        guard let imagePath = ImageStore.path(for: name) else {
            throw NSError(description: "The image path could not be retrieved")
        }
        
        try imageData.write(to: imagePath)
    }
    
    private static func path(for imageName: String, fileExtension: String = "png") -> URL? {
        let directory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        return directory?.appendingPathComponent("\(imageName).\(fileExtension)")
    }
}

private extension NSError {
    
    convenience init(description: String) {
        self.init(domain: "com.thecodedself.ImageStore",
                  code: 10042,
                  userInfo: [NSLocalizedDescriptionKey: description])
    }
}
