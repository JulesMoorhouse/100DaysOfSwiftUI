//
//  ContentView.swift
//  P13B InstaFilter
//
//  Created by Julian Moorhouse on 08/04/2021.
//

import CoreImage
import CoreImage.CIFilterBuiltins
import SwiftUI

struct ContentView: View {
    @State private var image: Image?

    var body: some View {
        VStack {
            image?
                .resizable()
                .scaledToFit()
        }
        .onAppear(perform: loadImage)
    }

    func loadImage() {
        guard let inputImage = UIImage(named: "apollo1")
        else { return }
        let beginImage = CIImage(image: inputImage)

        let context = CIContext()
        //let currentFilter = CIFilter.sepiaTone()
        //
        //currentFilter.inputImage = beginImage
        //currentFilter.intensity = 1
        //---------------------------------
        //let currentFilter = CIFilter.pixellate()
        //
        //currentFilter.inputImage = beginImage
        //currentFilter.scale = 100
        //---------------------------------
        //let currentFilter = CIFilter.crystallize()
        //
        //currentFilter.inputImage = beginImage
        //currentFilter.radius = 200
        //---------------------------------
        guard let currentFilter = CIFilter(name: "CITwirlDistortion") else { return }
        
        currentFilter.setValue(beginImage, forKey: kCIInputImageKey)
        currentFilter.setValue(2000, forKey: kCIInputRadiusKey)
        currentFilter.setValue(CIVector(x: inputImage.size.width / 2, y: inputImage.size.height / 2), forKey: kCIInputCenterKey)
        
        guard let outputImage = currentFilter.outputImage
        else { return }
        
        if let cgimg = context.createCGImage(outputImage, from: outputImage.extent) {
            let uiImage = UIImage(cgImage: cgimg)
            image = Image(uiImage: uiImage)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
