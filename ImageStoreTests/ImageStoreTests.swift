//
//  ImageStoreTests.swift
//  ImageStoreTests
//
//  Created by Keegan Rush on 2017/09/27.
//  Copyright © 2017 thecodedself. All rights reserved.
//

import XCTest
@testable import ImageStore

class ImageStoreTests: XCTestCase {
    
    private let imageName = "testImageName"

    func testThatRetrievingUnknownImageReturnsNil() {
        let imageNameThatDoesNotExist = "imageNameNameThatDoesNotExist"
        let image = ImageStore.retrieve(imageNamed: imageNameThatDoesNotExist)
        XCTAssertNil(image)
    }

    func testThatAnImageCanBeStoredAndRetrievedAndDeleted() {
        let imageToStore = createImage()

        try? ImageStore.store(image: imageToStore, name: imageName)
        let retrievedImage = ImageStore.retrieve(imageNamed: imageName)!

        let retrievedImageData = retrievedImage.pngData()!
        let expectedImageData = imageToStore.pngData()!

        XCTAssertEqual(expectedImageData, retrievedImageData)

        ImageStore.delete(imageNamed: imageName)
        XCTAssertNil(ImageStore.retrieve(imageNamed: imageName))
    }
    
    private func createImage() -> UIImage {
        let rect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        defer { UIGraphicsEndImageContext() }
        
        let context = UIGraphicsGetCurrentContext()!
        
        context.setFillColor(UIColor.green.cgColor)
        context.fill(rect)
        return UIGraphicsGetImageFromCurrentImageContext()!
    }
    
}
