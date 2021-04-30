//
//  ImageSaver.swift
//  X07 Meetup
//
//  Created by Julian Moorhouse on 30/04/2021.
//

import SwiftUI

class ImageManager: NSObject {
    func writeToFile(photoFile: String, image: UIImage) {
        saveImage(imageFileName: photoFile, image: image)
    }

    func getDocumentDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }

    func saveImage(imageFileName: String, image: UIImage) {
        do {
            let filename = getDocumentDirectory().appendingPathComponent(imageFileName)

            let jpegData = image.jpegData(compressionQuality: 0.8)

            try jpegData?.write(to: filename, options: [.atomicWrite, .completeFileProtection])

            print("Saved correctly")
        } catch {
            print("Unable to save data. \(error.localizedDescription)")
            print("\(error)")
        }
    }

    func loadImage(imageFileName: String) -> Image {
        do {
            let filename = getDocumentDirectory().appendingPathComponent(imageFileName)

            let imageData = try? Data(contentsOf: filename)

            if let data = imageData {
                if let image2 = UIImage(data: data) {
                    return Image(uiImage: image2)
                }
            }
        }
        
        return Image(systemName: "questionmark.square.fill")
    }
}
